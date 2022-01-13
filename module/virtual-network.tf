# Create Virtual Network
resource "azurerm_virtual_network" "olivetech-vnet" {
  name                = "${var.org-prefix}-vnet-${random_string.myrandom.id}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.olivetech-rg.location
  resource_group_name = azurerm_resource_group.olivetech-rg.name
}

# Create Subnet
resource "azurerm_subnet" "olivetech-subnet" {
  name                 = "${var.org-prefix}-subnet-${random_string.myrandom.id}"
  resource_group_name  = azurerm_resource_group.olivetech-rg.name
  virtual_network_name = azurerm_virtual_network.olivetech-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create Public IP Address
resource "azurerm_public_ip" "olivetech-publicip" {
  name                = "${var.org-prefix}-publicip-${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.olivetech-rg.name
  location            = azurerm_resource_group.olivetech-rg.location
  allocation_method   = "Static"
  domain_name_label = "app1-vm-${random_string.myrandom.id}"
  tags = {
    environment = "Dev"
  }
}

# Create Network Interface
resource "azurerm_network_interface" "olivetech-vmnic" {
  name                = "${var.org-prefix}-vmnic"
  location            = azurerm_resource_group.olivetech-rg.location
  resource_group_name = azurerm_resource_group.olivetech-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.olivetech-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.olivetech-publicip.id 
  }
}