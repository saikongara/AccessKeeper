variable "data_lake_name" {
  description = "The name of the Azure Data Lake."
  type        = string
  default     = "my-data-lake"
}

variable "resource_group_name" {
  description = "The name of the resource group where the Data Lake will be created."
  type        = string
  default     = "my-resource-group"
}

variable "location" {
  description = "The Azure region where the Data Lake will be created."
  type        = string
  default     = "East US"
}

variable "role_assignments" {
  description = "A map of role assignments for Azure Active Directory groups to the Data Lake."
  type        = map(string)
  default     = {
    "Engineer_Onshore"   = "Storage Blob Data Contributor"
    "Engineer_Offshore"  = "Storage Blob Data Contributor"
    "Analyst_Onshore"    = "Storage Blob Data Reader"
    "Analyst_Offshore"   = "Storage Blob Data Reader"
    "Operations_Onshore" = "Storage Blob Data Reader"
    "Operations_Offshore" = "Storage Blob Data Reader"
  }
}