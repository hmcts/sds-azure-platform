module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.environment
  product     = var.product
  builtFrom   = var.builtFrom
}

module "api-mgmt-private" {
  source             = "git::https://github.com/hmcts/cnp-module-api-mgmt-private.git?ref=main"
  location           = var.location
  sku_name           = "Developer"
  vnet_rg            = var.vnet_rg
  vnet_name          = var.vnet_name
  env                = var.env
  virtualNetworkType = "Internal"
  department         = var.department
  common_tags        = module.ctags.common_tags
}

resource "azurerm_api_management_named_value" "environment-named-value-private" {
  name                = "environment"
  resource_group_name = var.vnet_rg
  api_management_name = module.api-mgmt-private.api_mgmt_name
  display_name        = "environment"
  value               = var.env
}