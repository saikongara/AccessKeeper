// This file defines the input variables for the Azure Cosmos DB module.

variable "cosmos_db_name" {
  description = "The name of the Azure Cosmos DB account."
  type        = string
  default     = "my-cosmos-db-account" // Replace with a meaningful name
}

variable "resource_group_name" {
  description = "The name of the resource group where the Cosmos DB account will be created."
  type        = string
  default     = "my-resource-group" // Replace with a meaningful name
}

variable "location" {
  description = "The Azure region where the Cosmos DB account will be created."
  type        = string
  default     = "East US" // Replace with a meaningful Azure region
}

variable "kind" {
  description = "The kind of the Cosmos DB account. Options are 'GlobalDocumentDB', 'MongoDB', 'Table', 'Cassandra', 'Gremlin'."
  type        = string
  default     = "GlobalDocumentDB" // Choose based on your requirements
}

variable "database_name" {
  description = "The name of the database within the Cosmos DB account."
  type        = string
  default     = "my-database" // Replace with a meaningful database name
}

variable "throughput" {
  description = "The throughput (RU/s) for the database."
  type        = number
  default     = 400 // Replace with a meaningful value based on your needs
}

variable "role_assignments" {
  description = "A map of role assignments for Azure Active Directory groups to the Cosmos DB account."
  type        = map(string)
  default     = {
    "Engineer_Onshore"   = "Cosmos DB Account Contributor"
    "Engineer_Offshore"  = "Cosmos DB Account Contributor"
    "Analyst_Onshore"    = "Cosmos DB Account Reader"
    "Analyst_Offshore"   = "Cosmos DB Account Reader"
    "Operations_Onshore" = "Cosmos DB Account Reader"
    "Operations_Offshore" = "Cosmos DB Account Reader"
  }
}