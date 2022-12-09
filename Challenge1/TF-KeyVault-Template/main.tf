data "azurerm_resource_group" "main" {
    name    = var.RG_NAME
}

data "azurerm_client_config" "current"{}
resource "azurerm_key_vault" "name" {
    name                        =   var.KV_NAME
    resource_group_name         = data.azurerm_resource_group.main.name
    location                    = data.azurerm_resource_group.main.location
    sku_name                    = "standard"
    purge_protection_enabled    = false
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    soft_delete_retention_days  = 7 

    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azurerm_client_config.current.object_id

        key_permissions =[
            "Get",
            "List",
            "Create",
            "Update",
            "Delete"
        ]

        secret_permissions = [ "Get","List","Set","Delete","Purge" ]
        
    }
}