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

variable "TF_WNSG_NAME" {
    default = "Web-NSG"
}

variable "TF_ANSG_NAME" {
    default = "App-NSG"
}
variable "TF_DNSG_NAME" {
    default = "Db-NSG"
}