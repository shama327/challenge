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
    default = "/subscriptions/7055d2c8-27ea-48aa-9285-75bc83244888/resourceGroups/RG_NAME/providers/Microsoft.Network/networkSecurityGroups/db-NSG"
}


variable "TF_SUBNET_ID" {
    default = "/subscriptions/7055d2c8-27ea-48aa-9285-75bc83244888/resourceGroups/RG_NAME/providers/Microsoft.Network/virtualNetworks/TF_VNET_NAME/subnets/TF_SUBNET3_NAME"
}

variable "primary_database" {
}
variable "primary_database_version" {
}
variable "primary_database_admin" {
}
variable "primary_database_password" {
}