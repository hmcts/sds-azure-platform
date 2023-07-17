terraform {
  required_version = "1.5.0"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.65.0"
    }
  }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}
provider "azurerm" {
  alias = "dnszone"
  features {}
  subscription_id = "ed302caf-ec27-4c64-a05e-85731c3ce90e"
}