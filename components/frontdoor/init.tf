terraform {
  required_version = "1.5.4"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.67.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "public_dns"
  subscription_id = "ed302caf-ec27-4c64-a05e-85731c3ce90e"
}
