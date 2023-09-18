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
  source = "git::https://github.com/hmcts/terraform-module-applicationgateway.git?ref=master"


  env                                = var.env
  subscription                       = var.subscription
  location                           = var.location
  private_ip_address                 = var.private_ip_address
  destinations                       = var.destinations
  frontends                          = var.frontends
  common_tags                        = module.ctags.common_tags
  oms_env                            = var.oms_env
  project                            = var.project
  vnet_rg                            = var.vnet_rg
  vnet_name                          = var.vnet_name
  log_analytics_workspace_id         = module.logworkspace.workspace_id
  enable_multiple_availability_zones = true
}
