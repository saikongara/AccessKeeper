variable "table_name" {
  description = "The name of the DynamoDB table."
  type        = string
  default     = "example-dynamodb-table"
}

variable "read_capacity" {
  description = "The read capacity units for the DynamoDB table."
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "The write capacity units for the DynamoDB table."
  type        = number
  default     = 5
}

variable "hash_key" {
  description = "The hash key for the DynamoDB table."
  type        = string
  default     = "id"
}

variable "hash_key_type" {
  description = "The type of the hash key for the DynamoDB table."
  type        = string
  default     = "S"
}

variable "billing_mode" {
  description = "The billing mode for the DynamoDB table."
  type        = string
  default     = "PROVISIONED"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "role_name" {
  description = "The name of the IAM role."
  type        = string
  default     = "example-role"
}

variable "group_ids" {
  description = "A list of group IDs for the IAM role policy attachment."
  type        = list(string)
  default     = []
}