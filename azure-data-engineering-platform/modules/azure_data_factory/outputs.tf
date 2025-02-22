output "data_factory_id" {
  description = "The ID of the Azure Data Factory resource."
  value       = azurerm_data_factory.example.id
}

output "data_factory_name" {
  description = "The name of the Azure Data Factory resource."
  value       = azurerm_data_factory.example.name
}

output "data_factory_location" {
  description = "The location of the Azure Data Factory resource."
  value       = azurerm_data_factory.example.location
}

output "data_factory_resource_group_name" {
  description = "The name of the resource group containing the Azure Data Factory."
  value       = azurerm_data_factory.example.resource_group_name
}