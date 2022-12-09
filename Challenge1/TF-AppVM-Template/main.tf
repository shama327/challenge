resource "random_password" "main" {
    length              = 16
    special             = false
    override_special    = "!@#$%&*()-_=+[]{}<>:?" 
}

data "azurerm_resource_group" "main" {
    name        = var.RG_NAME
    
}

resource "azurerm_subnet_network_security_group_association" "app-nsg-subnet" {
    subnet_id                   = var.TF_SUBNET_ID
    network_security_group_id   = var.TF_NSG_ID
}

resource "azurerm_public_ip" "main" {
    name                = "${var.VM_Name}-pip"
    resource_group_name =  data.azurerm_resource_group.main.name
    location            =  data.azurerm_resource_group.main.location
    allocation_method   = "Dynamic"
    ip_version          = "IPv4" 
    sku                 = "Basic" 
    
}

resource "azurerm_network_interface" "main" {
    resource_group_name = data.azurerm_resource_group.main.name
    location            = data.azurerm_resource_group.main.location
    name                = "${var.VM_Name}-NIC"
    ip_configuration {

        name                            = "${var.VM_Name}-conifg"
        private_ip_address_allocation   = "Dynamic"
        private_ip_address_version      = "IPv4"
        subnet_id                       = var.TF_SUBNET_ID
        public_ip_address_id            = azurerm_public_ip.main.id 

    }
}


resource "azurerm_windows_virtual_machine" "main" {
    name                            =  var.VM_Name
    resource_group_name             =  data.azurerm_resource_group.main.name
    location                        =  data.azurerm_resource_group.main.location
    admin_username                  =  var.ADMIN_USER
    admin_password                  =  random_password.main.result
    network_interface_ids           = [ azurerm_network_interface.main.id] 
    size                            =  var.VM_SIZE

    source_image_reference {
        publisher   = var.VM_IMAGE_PUBLISHER
        offer       = var.VM_IMAGE_OFFER
        sku         = var.VM_IMAGE_SKU
        version     = var.VM_IMAGE_VERSION
    }
    os_disk {
        disk_size_gb            = var.VM_DISK_SIZE_IN_GB
        caching                 = "ReadWrite" 
        storage_account_type    =  var.VM_STORGAE_ACCOUNT_TYPE
    }


}

resource "azurerm_key_vault_secret" "main" {
    name            = "${var.VM_Name}-secret"
    value           = random_password.main.result
    key_vault_id    = var.KV_ID
}