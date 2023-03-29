// terraform doesn't let you have undeclared vars used from a tfvars file
// We link this file using a symbolic link  (`ln -s ../../environments/variable.tf variable.tf`) in each component directory

variable "destinations" {}
variable "env" {}
variable "environment" {}
variable "frontends" {}
variable "location" {}
variable "oms_env" {}
variable "private_ip_address" {}
variable "project" {}
variable "subscription" {}
variable "vnet_name" {}
variable "vnet_rg" {}
variable "product" {}
variable "builtFrom" {}
variable "traffic_manager_endpoints" { default = {} }
variable "traffic_manager_profiles" { default = {} }
variable "shutter_rg" { default = "" }
variable "cdn_sku" { default = "" }
variable "department" { default = "sds" }
variable "apim_sku_name" { default = "Developer" }
variable "hub" { default = "sbox" }

variable "expiresAfter" {
  description = "Date when Sandbox resources can be deleted. Format: YYYY-MM-DD"
  default     = "3000-01-01"
}