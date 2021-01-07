terraform {
  required_version = ">= 0.14.4"

  backend "azurerm" {
    subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # https://github.com/terraform-providers/terraform-provider-azurerm/issues/8208
      version = "2.41.0"
    }
  }
}

provider "azurerm" {
  features {}

}
