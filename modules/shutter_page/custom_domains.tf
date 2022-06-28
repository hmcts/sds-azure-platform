resource "azurerm_cdn_endpoint_custom_domain" "this" {
  for_each = { for frontend in var.shutter_apps : frontend.name => frontend
  }

  name            = replace(each.value.custom_domain, ".", "-")
  cdn_endpoint_id = azurerm_cdn_endpoint.shutter_endpoint[each.value.name].id
  host_name       = each.value.custom_domain


  dynamic "cdn_managed_https" {
    for_each = lookup(each.value, "ssl_mode", "") == "AzureKeyVault" ? {} : { type = "Dedicated" }
    content {
      certificate_type = "Dedicated"
      protocol_type    = "ServerNameIndication"
      tls_version      = "TLS12"
    }
  }
  dynamic "user_managed_https" {
    for_each = lookup(each.value, "ssl_mode", "") == "AzureKeyVault" ? { key_vault_certificate_id = data.azurerm_key_vault_secret.certificate[each.value["name"]].id } : {}
    content {
      key_vault_certificate_id = user_managed_https.key_vault_certificate_id
      tls_version              = "TLS12"
    }
  }



}


 