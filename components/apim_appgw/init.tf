terraform {
  required_version = ">= 1.10.4, <= 1.11.0"

  backend "azurerm" {
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  subscription_id                 = local.hub[local.hub_env].subscription
  resource_provider_registrations = "none"
  features {}
  alias = "hub"
}


provider "azurerm" {
  subscription_id                 = var.key_vault_subscription
  resource_provider_registrations = "none"
  features {}
  alias = "kv"
}