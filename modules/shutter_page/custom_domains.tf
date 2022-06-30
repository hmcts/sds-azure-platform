resource "azurerm_cdn_endpoint_custom_domain" "this" {
  for_each = { for frontend in var.shutter_apps : frontend.name => frontend
  }

  name            = replace(each.value.custom_domain, ".", "-")
  cdn_endpoint_id = azurerm_cdn_endpoint.shutter_endpoint[each.value.name].id
  host_name       = each.value.custom_domain

  dynamic "user_managed_https" {
    for_each = lookup(each.value, "cdn_ssl_mode", var.ssl_mode) == "AzureKeyVault" ? { key_vault_certificate_id = "" } : {}
    content {
      key_vault_certificate_id = data.azurerm_key_vault_secret.certificate[each.value["name"]].id
      tls_version              = "TLS12"
    }
  }

} 