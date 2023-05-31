resource "azurerm_cdn_endpoint" "shutter_endpoint" {
  for_each = { for frontend in var.shutter_apps : frontend.name => frontend
  }
  # Option to override shutter name to stop CFT clashes
  name                   = each.value.shutter_name_override != "false" ? substr("hmcts-${each.value.shutter_name_override}-shutter-${var.env}", 0, 48) : substr("hmcts-${split(".", replace("${each.value.custom_domain}", "www.", ""))[0]}-shutter-${var.env}", 0, 48)
  profile_name           = azurerm_cdn_profile.main["${each.value.name}"].name
  location               = "West US"
  resource_group_name    = data.azurerm_resource_group.shutter.name
  is_http_allowed        = "false"
  is_compression_enabled = "false"

  origin {
    name      = replace(azurerm_storage_account.shutter_store["${each.value.name}"].primary_web_host, ".", "-")
    host_name = azurerm_storage_account.shutter_store["${each.value.name}"].primary_web_host
  }

  origin_host_header = azurerm_storage_account.shutter_store["${each.value.name}"].primary_web_host

  tags = var.common_tags

}

