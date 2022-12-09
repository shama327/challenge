
data "azurerm_resource_group" "main" {
    name        = var.RG_NAME
}

resource "azurerm_subnet_network_security_group_association" "db-nsg-subnet" {
    subnet_id                   = var.TF_SUBNET_ID
    network_security_group_id   = var.TF_NSG_ID
}

resource "azurerm_sql_server" "primary" {
    name = var.primary_database
    resource_group_name = data.azurerm_resource_group.main.name
    location = data.azurerm_resource_group.main.location
    version = var.primary_database_version
    administrator_login = var.primary_database_admin
    administrator_login_password = var.primary_database_password
}

resource "azurerm_sql_database" "db" {
  name                = "db"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  server_name         = azurerm_sql_server.primary.name
}