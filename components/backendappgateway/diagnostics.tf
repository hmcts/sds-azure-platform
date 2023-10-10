data "azurerm_storage_account" "diagnostics" {
  name                     = "hmctssdsdiag${var.env}"
  resource_group_name      = "lz-${var.env}-rg"
}