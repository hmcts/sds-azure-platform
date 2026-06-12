data "azurerm_storage_account" "diagnostics" {
  name                = "hmctssdsdiag${var.env}"
  resource_group_name = "lz-${var.env}-rg"
}

resource "azurerm_monitor_diagnostic_setting" "appgateway" {
  name                       = "appgw-diagnostics-${var.env}"
  target_resource_id         = azurerm_application_gateway.ag[0].id
  storage_account_id         = data.azurerm_storage_account.diagnostics.id
  log_analytics_workspace_id = module.logworkspace.workspace_id

  enabled_log {
    category = "ApplicationGatewayAccessLog"
    retention_policy {
      enabled = true
      days    = 90
    }
  }

  enabled_log {
    category = "ApplicationGatewayPerformanceLog"
    retention_policy {
      enabled = true
      days    = 90
    }
  }

  enabled_log {
    category = "ApplicationGatewayFirewallLog"
    retention_policy {
      enabled = true
      days    = 90
    }
  }

  metric {
    category = "AllMetrics"
    retention_policy {
      enabled = true
      days    = 90
    }
  }
}