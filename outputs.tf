// outputs.tf for the Azure Data Engineering Authentication Module

output "data_lake_role_assignment" {
  description = "Role assignments for Azure Data Lake"
  value       = module.azure_data_lake.role_assignments
}

output "data_factory_role_assignment" {
  description = "Role assignments for Azure Data Factory"
  value       = module.azure_data_factory.role_assignments
}

output "databricks_role_assignment" {
  description = "Role assignments for Azure Databricks"
  value       = module.azure_databricks.role_assignments
}

output "service_bus_role_assignment" {
  description = "Role assignments for Azure Service Bus"
  value       = module.azure_service_bus.role_assignments
}

output "logic_apps_role_assignment" {
  description = "Role assignments for Azure Logic Apps"
  value       = module.azure_logic_apps.role_assignments
}

output "log_analytics_role_assignment" {
  description = "Role assignments for Azure Log Analytics"
  value       = module.azure_log_analytics.role_assignments
}

output "key_vault_role_assignment" {
  description = "Role assignments for Azure Key Vault"
  value       = module.azure_key_vault.role_assignments
}

output "cosmos_db_role_assignment" {
  description = "Role assignments for Azure Cosmos DB"
  value       = module.azure_cosmos_db.role_assignments
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.data_engineering_rg.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.data_engineering_rg.location
}