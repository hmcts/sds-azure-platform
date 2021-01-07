variable "env" {
  type = string
}
variable "subscription" {
  type = string
}
variable "project" {
  type = string
}
variable "location" {
  type = string
}
variable "frontends" {
  type = any
}
variable "subscription_id" {
  type = string
}

variable "certificate_key_vault_name" {
  type = string
}
variable "oms_env" {
  type = string
}
variable "key_vault_resource_group" {
  type = string
}
variable "data_subscription" {
  type = string

}
variable "environment" {
  type = string
}

variable "vnet_rg" {}
variable "vnet_name" {}
variable "private_ip_address" {}

