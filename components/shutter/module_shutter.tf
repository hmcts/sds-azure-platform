
data "azurerm_subscription" "current" {}

locals {
  subscription_short_name = replace(lower(data.azurerm_subscription.current.display_name), "sharedservices", "sds")
  key_vault_name          = "acme${replace(lower(local.subscription_short_name), "-", "")}"
}

/* module "shutter" {
  source                     = "../../modules/shutter_page"
  resource_group_name        = var.shutter_rg
  env                        = var.env
  shutter_apps               = local.shutter_apps
  common_tags                = module.ctags.common_tags
  certificate_key_vault_name = local.key_vault_name
  subscription               = var.subscription
  shutter_rg                 = var.shutter_rg
  cdn_sku                    = var.cdn_sku
} */

module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.environment
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
}