// outputs.tf for Azure Databricks module

output "databricks_workspace_id" {
  description = "The ID of the Azure Databricks workspace."
  value       = azurerm_databricks_workspace.example.id
}

output "databricks_workspace_url" {
  description = "The URL of the Azure Databricks workspace."
  value       = azurerm_databricks_workspace.example.workspace_url
}

output "databricks_admin_role_assignment" {
  description = "Role assignment for Databricks Admin."
  value       = azurerm_role_assignment.databricks_admin.id
}

output "databricks_user_role_assignment" {
  description = "Role assignment for Databricks User."
  value       = azurerm_role_assignment.databricks_user.id
}