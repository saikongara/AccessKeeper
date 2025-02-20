// This file specifies the outputs from the Azure Cosmos DB module.

output "cosmos_db_account_id" {
  description = "The ID of the Azure Cosmos DB account."
  value       = azurerm_cosmosdb_account.example.id
}

output "cosmos_db_primary_master_key" {
  description = "The primary master key for the Azure Cosmos DB account."
  value       = azurerm_cosmosdb_account.example.primary_master_key
}

output "cosmos_db_uri" {
  description = "The URI of the Azure Cosmos DB account."
  value       = azurerm_cosmosdb_account.example.endpoint
}