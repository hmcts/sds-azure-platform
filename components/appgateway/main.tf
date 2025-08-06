module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.environment

}

module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.environment
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
  autoShutdown = var.autoShutdown
}

module "appgateway" {
  providers = {
    azurerm     = azurerm
    azurerm.hub = azurerm.hub
    azurerm.kv  = azurerm.kv
  }

  source = "git::https://github.com/hmcts/terraform-module-applicationgateway.git?ref=master"


  env                                          = var.env
  subscription                                 = var.subscription
  location                                     = var.location
  private_ip_address                           = var.private_ip_address
  destinations                                 = var.destinations
  frontends                                    = var.frontends
  common_tags                                  = module.ctags.common_tags
  oms_env                                      = var.oms_env
  project                                      = var.project
  vnet_rg                                      = var.vnet_rg
  vnet_name                                    = var.vnet_name
  log_analytics_workspace_id                   = module.logworkspace.workspace_id
  diagnostics_storage_account_id               = data.azurerm_storage_account.diagnostics.id
  enable_multiple_availability_zones           = true
  vault_name                                   = local.key_vault_name
  key_vault_resource_group                     = local.key_vault_resource_group
  ssl_certificate_name                         = var.ssl_certificate

  # Control the rollout of the TLS 1.0/1.1 deprecation, the ternary should be removed once the rollout is complete
  ssl_policy = var.env == "sbox" ? var.ssl_policy : local.current_ssl_policy
}
