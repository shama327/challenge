variable "SP_CLIENT_ID" {
}

variable "SP_CLIENT_SECRET" {
}
variable "SP_TENANT_ID" {
}
variable "SP_SUBSCRIPTION_ID" {

}

variable "RG_NAME" {
}

variable "TF_NSG_ID" {
    default = "/subscriptions/7055d2c8-27ea-48aa-9285-75bc83244888/resourceGroups/RG_NAME/providers/Microsoft.Network/networkSecurityGroups/app-NSG"
}


variable "TF_SUBNET_ID" {
    default = "/subscriptions/7055d2c8-27ea-48aa-9285-75bc83244888/resourceGroups/RG_NAME/providers/Microsoft.Network/virtualNetworks/TF_VNET_NAME/subnets/TF_SUBNET2_NAME"
}

variable "VM_Name" {
    default = "tfwin2022"
}

variable "ADMIN_USER" {
    default = "azadmin"
}

variable "VM_SIZE" {
    default = "Standard_B16ms"
}
variable "VM_STORGAE_ACCOUNT_TYPE" {
    default = "StandardSSD_LRS"
}
variable "VM_DISK_SIZE_IN_GB" {
    default = 256
}

variable "VM_IMAGE_PUBLISHER" {
    default = "MicrosoftWindowsServer"
}

variable "VM_IMAGE_OFFER" {
    default = "WindowsServer"
}
variable "VM_IMAGE_SKU" {
    default = "2019-datacenter-with-containers-g2"
}
variable "VM_IMAGE_VERSION" {
    default = "17763.3406.220909"
}

variable "KV_ID" {
    default = "/subscriptions/7055d2c8-27ea-48aa-9285-75bc83244888/resourceGroups/RG-Linux-22/providers/Microsoft.KeyVault/vaults/LinuxKV22"
}