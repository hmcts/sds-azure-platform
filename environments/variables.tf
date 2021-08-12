// terraform doesn't let you have undeclared vars used from a tfvars file
// We link this file using a symbolic link  (`ln -s ../../environments/variables.tf variables.tf`) in each component directory

variable "destinations" {}
variable "env" {}
variable "environment" {}
variable "frontends" {}
variable "location" {}
variable "oms_env" {}
variable "be_private_ip_address" {}
variable "private_ip_address" {}
variable "project" {}
variable "subscription" {}
variable "vnet_name" {}
variable "vnet_rg" {}
variable "product" {}
variable "builtFrom" {}
variable "traffic_manager_endpoints" { default = {} }
variable "traffic_manager_profiles" { default = {} }
variable "shutter_rg" {}
variable "resource_group_name" {}
variable "certificate_key_vault_name" {}
variable "cdn_sku" {}
