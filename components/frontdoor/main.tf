module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.environment

}

module "landing_zone" {
  source = "git::https://github.com/hmcts/terraform-module-frontdoor.git?ref=master"

  common_tags                = local.common_tags
  env                        = var.env
  subscription               = var.subscription
  project                    = var.project
  location                   = var.location
  frontends                  = var.frontends
  enable_ssl                 = true
  ssl_mode                   = "AzureKeyVault"
  resource_group             = azurerm_resource_group.fd_rg.name
  subscription_id            = data.azurerm_subscription.current.subscription_id
  certificate_key_vault_name = var.certificate_key_vault_name
  oms_env                    = var.oms_env
  certificate_name_check     = true
  key_vault_resource_group   = var.key_vault_resource_group
  log_analytics_workspace_id = module.logworkspace.workspace_id
  appgwbackends              = var.appgwbackends
}