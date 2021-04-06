// terraform doesn't let you have undeclared vars used from a tfvars file
// We link this file using a symbolic link  (`ln -s ../../environments/variables.tf variables.tf`) in each component directory

variable "certificate_key_vault_name" {}
variable "destinations" {}
variable "env" {}
variable "environment" {}
variable "frontends" {}
variable "key_vault_resource_group" {}
variable "location" {}
variable "oms_env" {}
variable "be_private_ip_address" {}
variable "private_ip_address" {}
variable "project" {}
variable "subscription" {}
variable "vault_name" {}
variable "vnet_name" {}
variable "vnet_rg" {}
variable "product" {}
variable "builtFrom" {}
