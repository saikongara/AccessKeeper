variable "servicebus_namespace_name" {
  description = "The name of the Azure Service Bus namespace."
  type        = string
  default     = "my-servicebus-namespace"
}

variable "servicebus_queue_name" {
  description = "The name of the Azure Service Bus queue."
  type        = string
  default     = "my-servicebus-queue"
}

variable "resource_group_name" {
  description = "The name of the resource group where the Service Bus will be created."
  type        = string
  default     = "my-resource-group"
}

variable "location" {
  description = "The Azure region where the Service Bus will be created."
  type        = string
  default     = "East US"
}

variable "role_assignments" {
  description = "A map of role assignments for Azure Active Directory groups to the Service Bus."
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