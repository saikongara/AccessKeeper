variable "logic_app_name" {
  description = "The name of the Azure Logic App."
  type        = string
  default     = "my-logic-app"
}

variable "resource_group_name" {
  description = "The name of the resource group where the Logic App will be created."
  type        = string
  default     = "my-resource-group"
}

variable "location" {
  description = "The Azure region where the Logic App will be created."
  type        = string
  default     = "East US"
}

variable "role_assignments" {
  description = "A map of role assignments for Azure Active Directory groups to the Logic App."
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