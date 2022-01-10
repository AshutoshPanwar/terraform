# Resource Block
# Create a resource group

resource "azurerm_resource_group" "tf-rg-1" {
  name = "tf-rg1"
  location = "centralindia"
}