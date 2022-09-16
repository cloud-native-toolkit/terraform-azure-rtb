terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

locals {
  name_prefix = "${var.resource_group_name}-${random_string.cluster_id.result}"
}

resource "random_string" "cluster_id" {
    length = 5
    special = false
    upper = false
}