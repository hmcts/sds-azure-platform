terraform {
  required_version = ">= 0.14.4"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.41.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
  features {}

}
