locals {
  description = "Local variables."

  short_region               = local.region_short_names[var.location]
  region                     = local.region_names[var.location]
  short_resource_name_prefix = "${upper(substr(var.lifecycle_type, 0, 1))}${upper(local.short_region)}"
  resource_prefix            = "${upper(var.lifecycle_type)}-${upper(local.region)}"

  rg_name  = "${upper(var.lifecycle_type)}-${upper(local.region)}-RG"
  nsg_name = "${upper(var.lifecycle_type)}-${upper(local.region)}-NSG"
  kv_name  = "${upper(var.lifecycle_type)}-${upper(local.region)}-KV"

  vnet_name   = "${upper(var.lifecycle_type)}-${upper(local.region)}-VNET"
  subnet_name = "${upper(var.lifecycle_type)}-${upper(local.region)}-SUBNET"

  tags = {
    location       = var.location
    environment    = var.lifecycle_type
    resource_group = local.rg_name
  }

  region_names = {
    "Central US" = "CENTRALUS"
    "East US"    = "EASTUS"
  }

  region_short_names = {
    "Central US" = "cus"
    "East US"    = "eus"
  }
}
