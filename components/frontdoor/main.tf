provider "azurerm" {
  alias           = "public_dns"
  subscription_id = "ed302caf-ec27-4c64-a05e-85731c3ce90e"

  features {}
}

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

moved {
  from = module.premium_front_door[0]
  to   = module.premium_front_door
}
module "premium_front_door" {
  source = "git::https://github.com/hmcts/terraform-module-frontdoor.git?ref=DTSPO-13992-test-new-version-of-frontdoor"

  common_tags                = module.ctags.common_tags
  env                        = var.env
  project                    = var.project
  location                   = var.location
  frontends                  = var.frontends
  ssl_mode                   = var.ssl_mode
  resource_group             = azurerm_resource_group.fd_rg.name
  subscription_id            = data.azurerm_subscription.current.subscription_id
  certificate_key_vault_name = local.vault_name
  oms_env                    = var.oms_env
  certificate_name_check     = true
  key_vault_resource_group   = "sds-platform-${var.environment}-rg"
  log_analytics_workspace_id = module.logworkspace.workspace_id

  diagnostics_storage_account_id    = azurerm_storage_account.diagnostics.id
  send_access_logs_to_log_analytics = false
}

