data "azurerm_key_vault_secret" "certificate" {
  for_each = { for frontend in var.shutter_apps : frontend.name => frontend
  }

  name         = each.value.certificate_name
  key_vault_id = data.azurerm_key_vault.certificate_vault.id
}

resource "azurerm_cdn_endpoint_custom_domain" "this" {
  for_each = { for frontend in var.shutter_apps : frontend.name => frontend
  }

  name            = replace(each.value.custom_domain, ".", "-")
  cdn_endpoint_id = azurerm_cdn_endpoint.shutter_endpoint[each.value.name].id
  host_name       = each.value.custom_domain

  user_managed_https {
    key_vault_certificate_id = data.azurerm_key_vault_secret.certificate[each.value.name].id
  }
}

