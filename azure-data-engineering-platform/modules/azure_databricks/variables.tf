variable "databricks_workspace_name" {
  description = "The name of the Azure Databricks workspace."
  type        = string
  default     = "my-databricks-workspace"
}

variable "resource_group_name" {
  description = "The name of the resource group where the Databricks workspace will be created."
  type        = string
  default     = "my-resource-group"
}

variable "location" {
  description = "The Azure region where the Databricks workspace will be created."
  type        = string
  default     = "East US"
}

variable "role_assignments" {
  description = "A map of role assignments for Azure Active Directory groups to the Databricks workspace."
  type        = map(string)
  default     = {
    "Engineer_Onshore"   = "Contributor"
    "Engineer_Offshore"  = "Contributor"
    "Analyst_Onshore"    = "Reader"
    "Analyst_Offshore"   = "Reader"
    "Operations_Onshore" = "Reader"
    "Operations_Offshore" = "Reader"
  }
}