terraform {
  required_version = "0.14.4"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.41.0"
    }
  }
}
provider "azurerm" {
  alias = "data"
  # subscription_id = "b72ab7b7-723f-4b18-b6f6-03b0f2c6a1bb"
  features {}
}
provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
  alias           = "loganalytics"
  subscription_id = local.log_analytics_workspace[[for x in keys(local.log_analytics_env_mapping) : x if contains(local.log_analytics_env_mapping[x], var.env)][0]].subscription_id
}
