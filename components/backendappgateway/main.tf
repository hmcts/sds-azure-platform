import {
  to = "/subscriptions/1baf5470-1c3e-40d3-a6f7-74bfbce4b348/resourceGroups/core-infra-intsvc-rg/providers/Microsoft.Network/privateDnsZones/demo.platform.hmcts.net/A/darts-proxy"
  id = module.privatedns.azurerm_private_dns_a_record.this["darts-proxy"]
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
  expiresAfter = var.expiresAfter
  autoShutdown = var.autoShutdown
}

data "azurerm_subscription" "current" {}

locals {
  subscription_short_name = replace(lower(data.azurerm_subscription.current.display_name), "sharedservices", "sds")
  vault_name              = "acme${replace(local.subscription_short_name, "-", "")}"
}

module "backendappgateway" {
  source = "git::https://github.com/hmcts/terraform-module-application-backend.git?ref=master"

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
  ssl_policy                 = var.ssl_policy
  common_tags                = module.ctags.common_tags

  diagnostics_storage_account_id     = data.azurerm_storage_account.diagnostics.id
  enable_multiple_availability_zones = true
}