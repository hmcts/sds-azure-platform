resource "azurerm_cdn_endpoint_custom_domain" "this" {
  for_each = { for frontend in var.shutter_apps : frontend.name => frontend
  }

  name            = replace(each.value.custom_domain, ".", "-")
  cdn_endpoint_id = azurerm_cdn_endpoint.shutter_endpoint[each.value.name].id
  host_name       = each.value.custom_domain
    
  lifecycle {
    ignore_changes = [
      # Ignore changes user_managed_https until we have another solution.
      # Reason: Null resource is used to config the cert config and since the PR below has been merged every time the
      # the pipeline is ran it removes the config because terraform wants to manage it.
      # https://github.com/hashicorp/terraform-provider-azurerm/pull/13283
      user_managed_https,
    ]
  }
}
