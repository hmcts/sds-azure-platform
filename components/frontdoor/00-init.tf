terraform {
  required_version = ">= 0.13.0"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # https://github.com/terraform-providers/terraform-provider-azurerm/issues/8208
      version = "2.40.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "REPLACE_ME"
}
provider "azurerm" {
  features {}
  alias           = "loganalytics"
  subscription_id = local.log_analytics_workspace[[for x in keys(local.log_analytics_env_mapping) : x if contains(local.log_analytics_env_mapping[x], var.env)][0]].subscription_id
}