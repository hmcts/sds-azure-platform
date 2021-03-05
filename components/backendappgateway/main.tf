module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.environment
}

module "backendappgateway" {
  source = "git::https://github.com/hmcts/terraform-module-application-backend.git?ref=master"

  yaml_path = "${path.cwd}/../../environments/${var.env}/backend_lb_config.yaml"

  env = var.env
  # subscription               = var.subscription
  vault_name                = var.vault_name
  location                  = var.location
  backend_pool_ip_addresses = var.destinations
  private_ip_address        = var.be_private_ip_address
  # oms_env                    = var.oms_env
  log_analytics_workspace_id = module.logworkspace.workspace_id
  vnet_rg                    = var.vnet_rg
  vnet_name                  = var.vnet_name
  key_vault_resource_group   = var.key_vault_resource_group
  common_tags                = local.common_tags
}
