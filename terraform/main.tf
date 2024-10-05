terraform {
  required_version = "~> 1.8.3"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.104.0"
    }
  }
  backend "local" {
    path = "./terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "regional_rg" {
  name     = local.rg_name
  location = var.location
  tags     = local.tags
}

module "network" {
  source                     = "./modules/network"
  short_resource_name_prefix = local.short_resource_name_prefix
  tags                       = local.tags
  resource_group_name        = azurerm_resource_group.regional_rg.name
  location                   = azurerm_resource_group.regional_rg.location
  virtual_network            = "regional_vnet"
  subnet                     = "regional_subnet"
}

module "keyvault" {
  source                     = "./modules/keyvault"
  short_resource_name_prefix = local.short_resource_name_prefix
  tags                       = local.tags
  resource_group_name        = azurerm_resource_group.regional_rg.name
  location                   = azurerm_resource_group.regional_rg.location
  target_tenant_id           = var.target_tenant_id
  kv_name                    = local.kv_name
  vnet_id                    = module.network.vnet_id
  depends_on                 = [module.network]
}

resource "random_password" "pg_password" {
  length  = 30
  special = true
}

module "postgres" {
  source                     = "./modules/postgres"
  short_resource_name_prefix = local.short_resource_name_prefix
  tags                       = local.tags
  resource_group_name        = azurerm_resource_group.regional_rg.name
  location                   = azurerm_resource_group.regional_rg.location
  delegated_subnet_id        = module.network.postgres_subnet_id
  vnet_id                    = module.network.vnet_id
  admin_login                = "pgadminuser"
  admin_password             = random_password.pg_password.result
  depends_on                 = [module.network]
}
