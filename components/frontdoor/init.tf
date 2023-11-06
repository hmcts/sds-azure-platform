terraform {
  required_version = ">= 1.6.0"

  backend "azurerm" {
    resource_group_name  = "azure-control-prod-rg"
    storage_account_name = "c5ca62022e7536c8d566csa"
    container_name       = "subscription-tfstate"
    key                  = "UK South/sds-platform/sds-azure-platform/prod/frontdoor/terraform.tfstate"
    subscription_id      = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
  }
}

provider "azurerm" {
  features {}
}
