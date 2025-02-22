variable "step_function_name" {
  description = "The name of the Step Function."
  type        = string
}

variable "role_arn" {
  description = "The ARN of the IAM role that the Step Function will assume."
  type        = string
}

variable "definition" {
  description = "The definition of the Step Function in Amazon States Language (ASL)."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Step Function."
  type        = map(string)
  default     = {
    Environment = "dev"
    Project     = "DataEngineering"
  }
}

variable "policy_actions" {
  description = "A list of actions that the Step Function's IAM policy will allow."
  type        = list(string)
  default     = [
    "dynamodb:*",
    "s3:*",
    "lambda:*",
    "glue:*",
    "secretsmanager:*",
    "sqs:*",
    "cloudwatch:*",
    "logs:*"
  ]
}

variable "groups" {
  description = "A list of IAM groups to assign to the Step Function roles."
  type        = list(string)
  default     = [
    "Engineer_Onshore",
    "Engineer_Offshore",
    "Analyst_Onshore",
    "Analyst_Offshore",
    "Operations_Onshore",
    "Operations_Offshore"
  ]
}