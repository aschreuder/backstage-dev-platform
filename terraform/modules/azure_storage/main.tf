resource "azurerm_storage_account" "backstage_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier
  
  tags = var.tags
}

resource "azurerm_storage_container" "backstage_storage_containter" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.backstage_storage_account.id
  container_access_type = var.container_access_type
}