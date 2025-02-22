variable "resource_group_name" {
  description = "The name of the resource group where the resources will be created."
  type        = string
  default     = "my-resource-group" // Replace with a meaningful name
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "East US" // Replace with a meaningful Azure region
}

variable "role_assignments" {
  description = "A map of role assignments for Azure Active Directory groups to the resources."
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