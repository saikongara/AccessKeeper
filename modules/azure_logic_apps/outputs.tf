output "logic_app_id" {
  description = "The ID of the Azure Logic App."
  value       = azurerm_logic_app_workflow.example.id
}

output "logic_app_name" {
  description = "The name of the Azure Logic App."
  value       = azurerm_logic_app_workflow.example.name
}

output "logic_app_resource_group" {
  description = "The resource group where the Azure Logic App is located."
  value       = azurerm_logic_app_workflow.example.resource_group_name
}

output "logic_app_location" {
  description = "The location of the Azure Logic App."
  value       = azurerm_logic_app_workflow.example.location
}