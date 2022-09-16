// Create route table
resource "azurerm_route_table" "rtb" {
    name = var.name == "" ? "${var.name_prefix}-rtb" : var.name
    resource_group_name = var.resource_group_name
    location = var.region
}

// Create routes
resource "azurerm_route" "routes" {
    for_each = {for route in var.routes: route.name => route}

    resource_group_name = var.resource_group_name
    route_table_name = azurerm_route_table.rtb.name

    name = each.value.name
    address_prefix = each.value.address_prefix
    next_hop_type = each.value.next_hop_type
    next_hop_in_ip_address = each.value.next_hop_type == "VirtualAppliance" ? each.value.next_hop_in_ip_address : null
}

// Associate subnets with route table
resource "azurerm_subnet_route_table_association" "subnets" {
    for_each = toset(var.subnet_ids)

    route_table_id = azurerm_route_table.rtb.id

    subnet_id = each.value.subnet_id
}
