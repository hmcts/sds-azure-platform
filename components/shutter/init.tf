terraform {
  required_version = "1.5.4"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.10.0"
    }
  }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}
