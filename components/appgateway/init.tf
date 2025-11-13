terraform {
  required_version = "1.13.3"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source   = "hashicorp/azurerm"
      vversion = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}

}

provider "azurerm" {
  subscription_id            = var.key_vault_subscription
  skip_provider_registration = "true"
  features {}
  alias = "kv"
}

provider "azurerm" {
  subscription_id            = local.hub[local.hub_env].subscription
  skip_provider_registration = "true"
  features {}
  alias = "hub"
}
