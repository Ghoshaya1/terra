resource "azurerm_virtual_network" "regional_vnet" {
  name                = var.virtual_network
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/8"]
  tags                = var.tags
}

resource "azurerm_subnet" "regional_postgres" {
  name                 = "${var.subnet}_postgres"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.regional_vnet.name
  address_prefixes     = ["10.0.6.0/24"]
  depends_on           = [azurerm_virtual_network.regional_vnet]
  service_endpoints = [
    "Microsoft.Sql",
    "Microsoft.Storage"
  ]

  delegation {
    name = "fs"

    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}
