output "storage_account_name" {
  value = module.storage_service.storage_account_name
}

output "storage_connection_string" {
  value     = module.storage_service.primary_connection_string
  sensitive = true
}