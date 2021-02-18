module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.environment
}


module "backend_app_gateway" {
  source = "git::https://github.com/hmcts/terraform-module-application-backend.git?ref=master"

  env                       = var.env
  subscription              = var.subscription
  vault_name                = var.vault_name
  location                  = var.location
  backend_pool_ip_addresses = var.backend_pool_ip_addresses
  private_ip_address        = var.private_ip_address
  //yaml_path                 = var.yaml_path
  oms_env                   = var.oms_env
  // log_analytics_workspace_id = module.logworkspace.workspace_id

}