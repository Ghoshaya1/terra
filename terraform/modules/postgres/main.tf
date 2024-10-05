resource "azurerm_private_dns_zone" "postgres_priv_dns" {
  name                = "privatelink.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "postgres_dns_netlink" {
  name                  = "postgres-network-link"
  private_dns_zone_name = azurerm_private_dns_zone.postgres_priv_dns.name
  virtual_network_id    = var.vnet_id
  resource_group_name   = var.resource_group_name
}

resource "azurerm_postgresql_flexible_server" "regional_postgres" {
  name                = lower("${var.short_resource_name_prefix}postgres")
  location            = var.location
  resource_group_name = var.resource_group_name
  version             = "14"

  delegated_subnet_id = var.delegated_subnet_id

  private_dns_zone_id    = azurerm_private_dns_zone.postgres_priv_dns.id
  administrator_login    = var.admin_login
  administrator_password = var.admin_password
  zone                   = "1"

  storage_mb = 32768

  sku_name = "GP_Standard_D4s_v3"
}
