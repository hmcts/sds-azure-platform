module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.environment

}


module "appgateway" {
  source = "git::https://github.com/hmcts/terraform-module-applicationgateway.git?ref=master"

  providers = {
    azurerm      = azurerm
    azurerm.data = azurerm.data
  }

  env                        = var.env
  subscription               = var.subscription
  vault_name                 = var.vault_name
  location                   = var.location
  private_ip_address         = var.private_ip_address
  destinations               = var.destinations
  frontends                  = var.frontends
  common_tags                = local.common_tags
  oms_env                    = var.oms_env
  project                    = var.project
  vnet_rg                    = var.vnet_rg
  vnet_name                  = var.vnet_name
  log_analytics_workspace_id = module.logworkspace.workspace_id

}
