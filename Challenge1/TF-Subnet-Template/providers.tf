provider "azurerm" {
    features {}
    client_id       = var.SP_CLIENT_ID
    client_secret   = var.SP_CLIENT_SECRET
    tenant_id       = var.SP_TENANT_ID
    subscription_id = var.SP_SUBSCRIPTION_ID
}