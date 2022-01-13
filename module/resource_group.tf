resource "azurerm_resource_group" "olivetech-rg" {
  name     = "${var.rg-name}-${var.org-prefix}-${var.locations["IND"]}"
  location = var.locations["IND"]
}