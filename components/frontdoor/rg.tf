resource "azurerm_resource_group" "fd_rg" {
  name     = "lz-${var.env}-rg"
  location = var.location
  tags     = module.ctags.common_tags
}
