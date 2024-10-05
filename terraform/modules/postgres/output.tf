output "fqdn" {
    # value = azurerm_storage_account.regional_storage_account.primary_connection_string
    value = azurerm_postgresql_flexible_server.regional_postgres.fqdn
    description = "Postgres FQDN"
}