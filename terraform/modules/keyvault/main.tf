resource "azurerm_key_vault" "regional_kv" {
  name                            = var.kv_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  tenant_id                       = var.target_tenant_id
  enabled_for_deployment          = true
  enabled_for_template_deployment = true
  enabled_for_disk_encryption     = true
  sku_name                        = "standard"

  enable_rbac_authorization = true

  # Network access
  public_network_access_enabled = true

  tags = var.tags
}
