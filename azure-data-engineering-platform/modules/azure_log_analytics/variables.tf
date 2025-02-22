variable "log_analytics_workspace_name" {
  description = "The name of the Azure Log Analytics workspace."
  type        = string
  default     = "my-log-analytics-workspace"
}

variable "resource_group_name" {
  description = "The name of the resource group where the Log Analytics workspace will be created."
  type        = string
  default     = "my-resource-group"
}

variable "location" {
  description = "The Azure region where the Log Analytics workspace will be created."
  type        = string
  default     = "East US"
}

variable "role_assignments" {
  description = "A map of role assignments for Azure Active Directory groups to the Log Analytics workspace."
  type        = map(string)
  default     = {
    "Engineer_Onshore"   = "Log Analytics Contributor"
    "Engineer_Offshore"  = "Log Analytics Contributor"
    "Analyst_Onshore"    = "Log Analytics Reader"
    "Analyst_Offshore"   = "Log Analytics Reader"
    "Operations_Onshore" = "Log Analytics Reader"
    "Operations_Offshore" = "Log Analytics Reader"
  }
}