output "storage_account_name" {
  value = azurerm_storage_account.backstage_storage_account.name
}

output "primary_connection_string" {
  value     = azurerm_storage_account.backstage_storage_account.primary_connection_string
  sensitive = true
}