# Resource Block
# Create a resource group

resource "azurerm_resource_group" "tf-rg-1" {
  name     = "tf-rg1${random_string.myrandom.id}"
  location = "centralindia"
}

resource "random_string" "myrandom" {
  length  = 16
  special = false
  upper   = false
}