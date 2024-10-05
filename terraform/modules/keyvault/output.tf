output "name" {
    value = azurerm_key_vault.regional_kv.name
    description = "Name of the regional Key vault resource"
}

output "id" {
    value = azurerm_key_vault.regional_kv.id
    description = "ID of the regional Key vault resource"
}