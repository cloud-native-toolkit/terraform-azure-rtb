# Azure Network Route Table

## Module Overview

Module creates a route table (RTB) on Azure with provided routes and associates with provided subnets. It includes the following resources:
- azurerm_route_table
- azurerm_route
- azurerm_subnet_route_table_association

### Software dependencies

This module has no dependencies on software components.

### Command line tools

- terraform >= 1.2.6

### Module dependencies

- cloud-native-toolkit/terraform-azure-resource-group
- cloud-native-toolkit/terraform-azure-subnets (optional if associating RTB with one or more subnets)

## Example Usage

```hcl-terraform
module "rtb" {
  source = "github.com/cloud-native-toolkit/terraform-azure-rtb"

  name_prefix          = var.name_prefix
  resource_group_name  = module.resource_group.name
  region               = module.resource_group.region
  subnet_ids           = module.ingress_subnet.ids

  routes = [{
    name                    = "test-route"
    address_prefix          = "0.0.0.0/0"
    next_hop_type           = "Internet"
    next_hop_in_ip_address  = ""
  }]
}
```

## Input Variables

This module has the following input variables:
| Variable | Mandatory / Optional | Default Value | Description |
| -------------------------------- | --------------| ------------------ | ----------------------------------------------------------------------------- |
| resource_group_name | Mandatory | "" | The resource group into which to deploy the NSG |
| region | Mandatory | "" | Region into which to deploy the NSG |
| name_prefix | Optional | "" | The prefix for the NSG name (module will append "-nsg" to this variable)  |
| name | Optional | "" | The full name for the NSG. One of name or name_prefix must be specified.  |
| subnet_ids | Optional | [] | List of subnet ids in the VNet to which to associate the NSG when created |
| routes | Optional | [] | List of routes to apply (refer to variables.tf for details) |

## Output Variables

This module has the following output variables:
| Variable | Description |
| -------------------------------- | ----------------------------------------------------------------------------- |
| id  | The Azure identification string of the created RTB  |
| name | The name of the created RTB |