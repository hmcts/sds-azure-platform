data "azurerm_resource_group" "shutter" {
  name = var.resource_group_name
}

data "azurerm_subscription" "current" {}

data "azurerm_key_vault" "certificate_vault" {
  name                = var.certificate_key_vault_name
  resource_group_name = var.key_vault_resource_group
}

data "azurerm_key_vault_secret" "certificate" {
  for_each = { for shutter_apps in var.shutter_apps :
    shutter_apps.name => shutter_apps
    if lookup(shutter_apps, "ssl_mode", "") == "AzureKeyVault"
  }
  name         = lookup(each.value, "certificate_name")
  key_vault_id = data.azurerm_key_vault.certificate_vault.id
}