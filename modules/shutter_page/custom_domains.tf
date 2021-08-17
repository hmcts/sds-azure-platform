resource "azurerm_cdn_endpoint_custom_domain" "this" {
  for_each = { for frontend in var.shutter_apps : frontend.name => frontend
  }

  name            = split(".", replace("${each.value.custom_domain}", "www.", ""))[0]
  cdn_endpoint_id = azurerm_cdn_endpoint.shutter_endpoint[each.value.name].id
  host_name       = each.value.custom_domain
}