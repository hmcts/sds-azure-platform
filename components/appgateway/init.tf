terraform {
  required_version = ">= 1.10.4, <= 1.11.0"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
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
  subscription_id            = var.key_vault_subscription
  resource_provider_registrations = "none"
  features {}
  alias = "kv"
}

provider "azurerm" {
  subscription_id            = local.hub[local.hub_env].subscription
  resource_provider_registrations = "none"
  features {}
  alias = "hub"
}
