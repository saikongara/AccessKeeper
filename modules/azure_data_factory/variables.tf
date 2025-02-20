variable "data_factory_name" {
  description = "The name of the Azure Data Factory."
  type        = string
  default     = "my-data-factory"
}

variable "resource_group_name" {
  description = "The name of the resource group where the Data Factory will be created."
  type        = string
  default     = "my-resource-group"
}

variable "location" {
  description = "The Azure region where the Data Factory will be created."
  type        = string
  default     = "East US"
}

variable "role_assignments" {
  description = "A map of role assignments for Azure Active Directory groups to the Data Factory."
  type        = map(string)
  default     = {
    "Engineer_Onshore"   = "Data Factory Contributor"
    "Engineer_Offshore"  = "Data Factory Contributor"
    "Analyst_Onshore"    = "Data Factory Reader"
    "Analyst_Offshore"   = "Data Factory Reader"
    "Operations_Onshore" = "Data Factory Reader"
    "Operations_Offshore" = "Data Factory Reader"
  }
}