

variable "name_prefix" {
    type        = string
    description = "Prefix for component names."
    default = ""
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group to deploy into"
}

// Following variables have defaults
variable "name" {
    type        = string
    description = "Name for route table. Leave blank to use name_prefix. (default = \"\")"
    default     = ""
}

variable "region" {
    type        = string
    description = "Region to deploy route table into."
    default     = "" 
}

variable "routes" {
    type = list(object({
        name            = string    // Name of the route
        address_prefix  = string    // Address CIDR for traffic or Azure Service Tag
        next_hop_type   = string    // gateway for traffic (None, Internet, VnetLocal, VirtualNetworkGateway, VirtualAppliance)
        next_hop_in_ip_address = string   // Address for Virtual Appliance
    }))
    description = "List of routes to create (default = \"\")"
    default = []
}

variable "subnet_ids" {
    type = list(string)
    description = "List of subnet ids to associate with route table (default = \"\")"
    default = []
}

