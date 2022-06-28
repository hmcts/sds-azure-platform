data "azurerm_resource_group" "shutter" {
  name = var.resource_group_name
}

data "azurerm_subscription" "current" {}

data "azurerm_key_vault" "certificate_vault" {
  name                = var.certificate_key_vault_name
  resource_group_name = var.key_vault_resource_group
}

data "azurerm_key_vault_secret" "certificate" {
  for_each = { for frontend in var.frontends :
    frontend.name => frontend
    if lookup(frontend, "ssl_mode", var.ssl_mode) == "AzureKeyVault"
  }
  name         = lookup(each.value, "certificate_name")
  key_vault_id = data.azurerm_key_vault.certificate_vault.id
}