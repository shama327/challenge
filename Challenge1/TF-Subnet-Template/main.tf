data "azurerm_resource_group" "main" {
    name        =  var.RG_NAME
}

data "azurerm_virtual_network" "main" {
    name                = var.TF_VNET_NAME
    resource_group_name = data.azurerm_resource_group.main.name
    
}

resource "azurerm_subnet" "web_subnet" {
    virtual_network_name = datazurerm_virtual_network.main.name
    name                 = var.TF_SUBNET1_NAME
    address_prefixes     = [var.Web_subnet_addr] 
    resource_group_name  = data.azurerm_resource_group.main.name

}
resource "azurerm_subnet" "app_subnet" {
    virtual_network_name = data.azurerm_virtual_network.main.name
    name                 = var.TF_SUBNET2_NAME
    address_prefixes     = [var.app_subnet_addr] 
    resource_group_name  = data.azurerm_resource_group.main.name

}
resource "azurerm_subnet" "db_subnet" {
    virtual_network_name = data.azurerm_virtual_network.main.name
    name                 = var.TF_SUBNET3_NAME
    address_prefixes     = [var.db_subnet_addr] 
    resource_group_name  = data.azurerm_resource_group.main.name

}
