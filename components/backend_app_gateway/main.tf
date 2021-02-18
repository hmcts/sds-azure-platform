provider "azurerm" {
  features {}

}

module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.environment
}


module "backend_app_gateway" {
  source = "git::https://github.com/hmcts/terraform-module-application-backend.git?ref=master"

  yaml_path = "${path.cwd}/backend_lb_config.yaml"

  env                       = var.env
  subscription              = var.subscription
  vault_name                = var.vault_name
  location                  = var.location
  backend_pool_ip_addresses = var.ss_apps_cluster_ips
  private_ip_address        = var.private_ip_address
  oms_env                   = var.oms_env
  // log_analytics_workspace_id = module.logworkspace.workspace_id

}