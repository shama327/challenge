data "azurerm_resource_group" "main" {
    name        =  var.RG_NAME
}

resource "azurerm_network_security_group" "web_nsg" {
    name                = var.TF_WNSG_NAME
    resource_group_name = data.azurerm_resource_group.main.name
    location            = data.azurerm_resource_group.main.location
}
resource "azurerm_network_security_rule" "web_sr" {
    name                        = "AllowAllCustomPorts"
    network_security_group_name = azurerm_network_security_group.web_nsg.name
    resource_group_name         = data.azurerm_resource_group.main.name
    protocol                    = "Tcp"
    priority                    = 101
    source_port_range           = "*"
    destination_port_ranges     = ["0-65535"]
    access                      = "Allow"
    direction                   = "Inbound" 
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
}
resource "azurerm_network_security_group" "app_nsg" {
    name                = var.TF_ANSG_NAME
    resource_group_name = data.azurerm_resource_group.main.name
    location            = data.azurerm_resource_group.main.location
}
resource "azurerm_network_security_rule" "app_sr" {
    name                        = "AllowAllCustomPorts"
    network_security_group_name = azurerm_network_security_group.app_nsg.name
    resource_group_name         = data.azurerm_resource_group.main.name
    protocol                    = "Tcp"
    priority                    = 101
    source_port_range           = "*"
    destination_port_ranges     = ["0-65535"]
    access                      = "Allow"
    direction                   = "Inbound" 
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
}
resource "azurerm_network_security_group" "db_nsg" {
    name                = var.TF_DNSG_NAME
    resource_group_name = data.azurerm_resource_group.main.name
    location            = data.azurerm_resource_group.main.location
}
resource "azurerm_network_security_rule" "db_sr" {
    name                        = "AllowAllCustomPorts"
    network_security_group_name = azurerm_network_security_group.db_nsg.name
    resource_group_name         = data.azurerm_resource_group.main.name
    protocol                    = "Tcp"
    priority                    = 101
    source_port_range           = "*"
    destination_port_ranges     = ["0-65535"]
    access                      = "Allow"
    direction                   = "Inbound" 
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
}