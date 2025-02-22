variable "secret_name" {
  description = "The name of the secret to be created in AWS Secrets Manager."
  type        = string
  default     = "my_secret_name" // Replace with a meaningful secret name
}

variable "secret_value" {
  description = "The value of the secret to be stored in AWS Secrets Manager."
  type        = string
  default     = "my_secret_value" // Replace with the actual secret value
}

variable "description" {
  description = "A description of the secret."
  type        = string
  default     = "This is a sample secret for demonstration purposes." // Provide a meaningful description
}

variable "tags" {
  description = "A map of tags to assign to the secret."
  type        = map(string)
  default     = {
    Environment = "dev"
    Project     = "DataEngineering"
  }
}

variable "role_assignments" {
  description = "A map of role assignments for the secret based on group names."
  type        = map(string)
  default     = {
    Engineer_Onshore   = "arn:aws:iam::123456789012:role/EngineerRole"
    Engineer_Offshore  = "arn:aws:iam::123456789012:role/EngineerRole"
    Analyst_Onshore    = "arn:aws:iam::123456789012:role/AnalystRole"
    Analyst_Offshore   = "arn:aws:iam::123456789012:role/AnalystRole"
    Operations_Onshore = "arn:aws:iam::123456789012:role/OperationsRole"
    Operations_Offshore = "arn:aws:iam::123456789012:role/OperationsRole"
  }
}

variable "group_ids" {
  description = "A list of group IDs for role assignments."
  type        = list(string)
  default     = []
}