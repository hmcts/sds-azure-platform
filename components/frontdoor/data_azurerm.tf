data "azurerm_subscription" "current" {}
data "azurerm_log_analytics_workspace" "log" {
  provider            = azurerm.loganalytics
  name                = local.log_analytics_workspace[[for x in keys(local.log_analytics_env_mapping) : x if contains(local.log_analytics_env_mapping[x], var.env)][0]].name
  resource_group_name = "oms-automation"
}