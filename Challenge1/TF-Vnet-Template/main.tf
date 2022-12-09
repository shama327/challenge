data "azurerm_resource_group" "main" {
    name        =  var.RG_NAME
}

data "azurerm_virtual_network" "main" {
    name                = var.TF_VNET_NAME
    resource_group_name = data.azurerm_resource_group.main.name
    location            = data.azurerm_resource_group.main.location
}