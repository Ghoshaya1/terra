output "vnet_id" {
  value       = azurerm_virtual_network.regional_vnet.id
  description = ""
}

output "postgres_subnet_id" {
  value       = azurerm_subnet.regional_postgres.id
  description = ""
}
