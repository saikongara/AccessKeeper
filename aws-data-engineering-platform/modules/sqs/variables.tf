// filepath: /aws-data-engineering-platform/aws-data-engineering-platform/modules/sqs/variables.tf
variable "queue_name" {
  description = "The name of the SQS queue to be created."
  type        = string
  default     = "my-sqs-queue" // Replace with a meaningful queue name
}

variable "visibility_timeout" {
  description = "The visibility timeout for the SQS queue in seconds."
  type        = number
  default     = 30 // Default visibility timeout
}

variable "message_retention_seconds" {
  description = "The duration (in seconds) for which the SQS queue retains messages."
  type        = number
  default     = 345600 // Default retention period of 4 days
}

variable "max_message_size" {
  description = "The maximum size of a message that can be sent to the SQS queue in bytes."
  type        = number
  default     = 262144 // Default maximum message size (256 KB)
}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed."
  type        = number
  default     = 0 // Default delay time
}

variable "role_assignments" {
  description = "A map of role assignments for the SQS queue based on group names."
  type        = map(string)
  default     = {
    "Engineer_Onshore"   = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
    "Engineer_Offshore"  = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
    "Analyst_Onshore"    = "arn:aws:iam::aws:policy/AmazonSQSReadOnlyAccess"
    "Analyst_Offshore"   = "arn:aws:iam::aws:policy/AmazonSQSReadOnlyAccess"
    "Operations_Onshore" = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
    "Operations_Offshore" = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
  }
}

variable "receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive."
  type        = number
  default     = 0 // Default wait time
}

variable "environment" {
  description = "The environment in which the SQS queue is being created."
  type        = string
}

variable "project_name" {
  description = "The name of the project."
  type        = string
}

variable "source_arn" {
  description = "The ARN of the source that is allowed to send messages to the SQS queue."
  type        = string
}