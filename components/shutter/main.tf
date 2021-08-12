locals {
  key_vault_name      = "acmedtssdssbox"
  resource_group_name = "sds-platform-sbox-rg"
}

module "shutter" {
  source                     = "git::https://github.com/hmcts/azure-platform-terraform.git//modules/shutter_page?ref=master"
  resource_group_name        = local.resource_group_name
  env                        = var.env
  shutter_apps               = var.frontends
  common_tags                = module.ctags.common_tags
  certificate_key_vault_name = local.key_vault_name
  subscription               = var.subscription
  shutter_rg                 = var.shutter_rg
  cdn_sku                    = var.cdn_sku
}

module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.environment
  product     = var.product
  builtFrom   = var.builtFrom
}