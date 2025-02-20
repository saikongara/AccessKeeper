output "data_lake_id" {
  description = "The ID of the Azure Data Lake resource."
  value       = azurerm_data_lake_storage_gen2.example.id
}

output "data_lake_name" {
  description = "The name of the Azure Data Lake resource."
  value       = azurerm_data_lake_storage_gen2.example.name
}

output "data_lake_endpoint" {
  description = "The endpoint URL of the Azure Data Lake resource."
  value       = azurerm_data_lake_storage_gen2.example.primary_endpoint
}

output "data_lake_role_assignments" {
  description = "The role assignments for the Azure Data Lake resource."
  value       = azurerm_role_assignment.example.*.id
}