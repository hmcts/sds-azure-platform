module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.environment

}

module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.environment
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = "3000-01-01" # never expire
}

locals {
  subscription_short_name = replace(lower(data.azurerm_subscription.current.display_name), "sharedservices", "sds")
  vault_name              = "acme${replace(local.subscription_short_name, "-", "")}"
}

module "landing_zone" {
  source = "git::https://github.com/hmcts/terraform-module-frontdoor.git?ref=master"

  common_tags                = module.ctags.common_tags
  env                        = var.env
  project                    = var.project
  location                   = var.location
  frontends                  = var.frontends
  ssl_mode                   = "FrontDoor"
  resource_group             = azurerm_resource_group.fd_rg.name
  subscription_id            = data.azurerm_subscription.current.subscription_id
  certificate_key_vault_name = local.vault_name
  oms_env                    = var.oms_env
  certificate_name_check     = true
  key_vault_resource_group   = "sds-platform-${var.environment}-rg"
  log_analytics_workspace_id = module.logworkspace.workspace_id
}

module "test_new_frontdoor" {
  source = "git::https://github.com/hmcts/terraform-module-frontdoor.git?ref=DTSPO-13992-test-new-version-of-frontdoor"

  common_tags                = module.ctags.common_tags
  env                        = var.env
  project                    = "hmcts-new-test"
  location                   = var.location
  frontends                  = var.frontends
  new_frontends              = var.new_frontends
  ssl_mode                   = "FrontDoor"
  resource_group             = azurerm_resource_group.fd_rg.name
  subscription_id            = data.azurerm_subscription.current.subscription_id
  certificate_key_vault_name = local.vault_name
  oms_env                    = var.oms_env
  certificate_name_check     = true
  key_vault_resource_group   = "sds-platform-${var.environment}-rg"
  log_analytics_workspace_id = module.logworkspace.workspace_id
  front_door_sku_name        = var.front_door_sku_name
  add_access_policy          = "false"
  add_access_policy_role     = "false"
}