
provider "azurerm" {
  alias = "data"
  features {}
  subscription_id = var.data_subscription
}
