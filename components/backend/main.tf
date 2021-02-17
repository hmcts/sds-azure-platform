module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.environment
}


module "backend" {
  source = "git::https://github.com/hmcts/terraform-module-application-backend.git?ref=master"

  env                        = var.env
  subscription               = var.subscription
  vault_name                 = var.vault_name
  location                   = var.location
  backend_pool_ip_addresses  = var.backend_pool_ip_addresses
  private_ip_address         = var.private_ip_address
  destinations               = var.destinations
  frontends                  = var.frontends
  common_tags                = local.common_tags
  oms_env                    = var.oms_env
  project                    = var.project
  log_analytics_workspace_id = module.logworkspace.workspace_id

}
