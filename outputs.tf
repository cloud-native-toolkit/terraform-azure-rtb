output "name" {
    depends_on = [
      azurerm_route_table.rtb
    ]

    value = azurerm_route_table.rtb.name
    description = "Name of the route table"
}

output "id" {
    value = azurerm_route_table.rtb.id
    description = "ID of the route table"
}