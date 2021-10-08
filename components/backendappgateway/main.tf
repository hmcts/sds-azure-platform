module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.environment
}
module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.environment
  product     = var.product
  builtFrom   = var.builtFrom
}

data "azurerm_subscription" "current" {}

locals {
  subscription_short_name = replace(lower(data.azurerm_subscription.current.display_name), "sharedservices", "sds")
  vault_name              = "acme${replace(local.subscription_short_name, "-", "")}"
}

module "backendappgateway" {
  source = "git::https://github.com/hmcts/terraform-module-application-backend.git?ref=DTSPO-4790"

  yaml_path = "${path.cwd}/../../environments/${var.env}/backend_lb_config.yaml"

  env                        = var.env
  vault_name                 = local.vault_name
  location                   = var.location
  backend_pool_ip_addresses  = var.destinations
  private_ip_address         = local.gateways[*].gateway_configuration.private_ip_address
  log_analytics_workspace_id = module.logworkspace.workspace_id
  vnet_rg                    = var.vnet_rg
  vnet_name                  = var.vnet_name
  key_vault_resource_group   = "sds-platform-${var.environment}-rg"
  common_tags                = module.ctags.common_tags

  enable_multiple_availability_zones = true
}