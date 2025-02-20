output "log_analytics_workspace_id" {
  description = "The ID of the Azure Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.example.id
}

output "log_analytics_workspace_primary_shared_key" {
  description = "The primary shared key for the Azure Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.example.primary_shared_key
}

output "log_analytics_workspace_name" {
  description = "The name of the Azure Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.example.name
}