variable "lambda_function_name" {
  description = "The name of the Lambda function."
  type        = string
  default     = "my_lambda_function"
}

variable "lambda_runtime" {
  description = "The runtime environment for the Lambda function."
  type        = string
  default     = "nodejs14.x"
}

variable "lambda_handler" {
  description = "The function entry point in your code."
  type        = string
  default     = "index.handler"
}

variable "lambda_role" {
  description = "The ARN of the IAM role that Lambda assumes when it executes the function."
  type        = string
  default     = "arn:aws:iam::123456789012:role/service-role/my_lambda_role"
}

variable "lambda_memory_size" {
  description = "The amount of memory available to the function at runtime."
  type        = number
  default     = 128
}

variable "lambda_timeout" {
  description = "The amount of time that Lambda allows a function to run before stopping it."
  type        = number
  default     = 3
}

variable "environment_variables" {
  description = "A map of environment variables for the Lambda function."
  type        = map(string)
  default     = {
    "ENV_VAR1" = "value1"
    "ENV_VAR2" = "value2"
  }
}

variable "role_assignments" {
  description = "A map of role assignments for the Lambda function."
  type        = map(string)
  default     = {
    "Engineer_Onshore"   = "arn:aws:iam::123456789012:role/Engineer_Onshore_Role"
    "Engineer_Offshore"  = "arn:aws:iam::123456789012:role/Engineer_Offshore_Role"
    "Analyst_Onshore"    = "arn:aws:iam::123456789012:role/Analyst_Onshore_Role"
    "Analyst_Offshore"   = "arn:aws:iam::123456789012:role/Analyst_Offshore_Role"
    "Operations_Onshore" = "arn:aws:iam::123456789012:role/Operations_Onshore_Role"
    "Operations_Offshore" = "arn:aws:iam::123456789012:role/Operations_Offshore_Role"
  }
}

variable "s3_bucket" {
  description = "The S3 bucket where the Lambda function code is stored."
  type        = string
}

variable "s3_key" {
  description = "The S3 key of the Lambda function code."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Lambda function."
  type        = map(string)
  default     = {}
}

variable "sqs_queue_arn" {
  description = "The ARN of the SQS queue that the Lambda function interacts with."
  type        = string
}