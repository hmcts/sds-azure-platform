module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.environment
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
}

module "api-mgmt" {
  source                         = "git::https://github.com/hmcts/cnp-module-api-mgmt-private.git?ref=DTSPO-17136-apim-upgrade-improvements"
  location                       = var.location
  sku_name                       = var.apim_sku_name
  virtual_network_resource_group = var.vnet_rg
  virtual_network_name           = var.vnet_name
  environment                    = var.env
  virtual_network_type           = "Internal"
  department                     = var.department
  common_tags                    = module.ctags.common_tags
  route_next_hop_in_ip_address   = local.hub[var.hub].ukSouth.next_hop_ip
  migration_variables            = var.migration_variables
}

resource "azurerm_api_management_named_value" "environment" {
  name                = "environment"
  resource_group_name = var.vnet_rg
  api_management_name = module.api-mgmt.name
  display_name        = "environment"
  value               = var.env
}
