

# Resource Group Variables
variable "resource_group_name" {
  type        = string
  description = "Resource group to be created."
}

variable "region" {
  type        = string
  description = "Region/location to deploy into."
}

variable "name_prefix" {
  type        = string
  description = "Prefix name that should be used for the cluster and services. If not provided then resource_group_name will be used"
  default     = ""
}

variable "vnet_cidr" {
  type        = string
  description = "CIDR for the VNet"
  default     = "10.0.0.0/18"
}


variable "subscription_id" {}

variable "client_id" {}

variable "client_secret" {}

variable "tenant_id" {}