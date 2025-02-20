variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
  default     = "my-key-vault"
}

variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault will be created."
  type        = string
  default     = "my-resource-group"
}

variable "location" {
  description = "The Azure region where the Key Vault will be created."
  type        = string
  default     = "East US"
}

variable "role_assignments" {
  description = "A map of role assignments for Azure Active Directory groups to the Key Vault."
  type        = map(string)
  default     = {
    "Engineer_Onshore"   = "Key Vault Contributor"
    "Engineer_Offshore"  = "Key Vault Contributor"
    "Analyst_Onshore"    = "Key Vault Reader"
    "Analyst_Offshore"   = "Key Vault Reader"
    "Operations_Onshore" = "Key Vault Reader"
    "Operations_Offshore" = "Key Vault Reader"
  }
}