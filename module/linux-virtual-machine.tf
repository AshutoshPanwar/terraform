resource "azurerm_linux_virtual_machine" "linux-VM" {
  name                = "${var.org-prefix}-linux-VM-${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.olivetech-rg.name
  location            = azurerm_resource_group.olivetech-rg.location
  size                = "Standard_F2"
  admin_username      = "olivetech-adminuser"
  network_interface_ids = [
    azurerm_network_interface.olivetech-vmnic.id,
  ]

  admin_ssh_key {
    username   = "olivetech-adminuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}