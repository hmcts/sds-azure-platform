module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.env
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
}

module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.env

}

data "azurerm_subscription" "current" {}

locals {
  key_vault_name = "acmedtssds${var.subscription}"
  dns_zone       = (var.env == "sbox") ? "sandbox" : var.env
}

module "app-gw" {

  providers = {
    azurerm     = azurerm
    azurerm.hub = azurerm.hub-sbox
    azurerm.kv  = azurerm.kv
  }

  source                                       = "git::https://github.com/hmcts/terraform-module-apim-application-gateway.git?ref=main"
  yaml_path                                    = "${path.cwd}/../../environments/${local.env}/apim_appgw_config.yaml"
  env                                          = local.dns_zone
  location                                     = var.location
  private_ip_address                           = var.hub_app_gw_private_ip_address
  backend_pool_ip_addresses                    = var.apim_appgw_backend_pool_ips
  backend_pool_fqdns                           = var.apim_appgw_backend_pool_fqdns
  vault_name                                   = local.key_vault_name
  vnet_rg                                      = local.vnet_rg
  vnet_name                                    = local.vnet_name
  common_tags                                  = module.ctags.common_tags
  log_analytics_workspace_id                   = module.logworkspace.workspace_id
  key_vault_resource_group                     = local.key_vault_resource_group
  subnet_name                                  = local.subnet_name
  waf_mode                                     = var.waf_mode
  exclusions                                   = var.apim_appgw_exclusions
  public_ip_enable_multiple_availability_zones = true
  project_name                                 = var.project
}


data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/${local.env}/apim_appgw_config.yaml"
}