terraform {
  required_version = ">=1.0.4"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.93.1"
    }
  }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}
