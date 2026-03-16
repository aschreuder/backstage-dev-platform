resource "azurerm_resource_group" "backstage" {
  name     = "rg-backstage-01"
  location = var.resource_group_location
  tags     = { department = "SRE" }
}

module "storage_service" {
  source = "./modules/azure_storage"

  # Passing variables to the module
  storage_account_name     = "stbackstage01"
  resource_group_name      = azurerm_resource_group.backstage.name
  location                 = azurerm_resource_group.backstage.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  access_tier              = var.access_tier
  container_name           = "sre-data"
  container_access_type    = var.container_access_type
  
  tags = {
    project = "backstage-self-service"
    owner   = "sre-team"
  }
}