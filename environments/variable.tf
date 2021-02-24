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
variable "private_ip_address" {}
variable "project" {}
variable "subscription" {}
variable "vault_name" {}
variable "vnet_name" {}
variable "vnet_rg" {}
<<<<<<< HEAD
variable "backends" {}
=======
>>>>>>> a6c6abf7143ed75870e5e67e853a834de8cb14f3
