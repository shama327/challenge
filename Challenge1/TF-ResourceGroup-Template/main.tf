resource "azurerm_resource_group" "main" {
    name        = var.RG_NAME
    location    = var.RG_LOCATION 
}