variable "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch log group."
  type        = string
  default     = "my-cloudwatch-log-group" // Replace with a meaningful log group name
}

variable "cloudwatch_log_retention" {
  description = "The number of days to retain log events in the specified log group."
  type        = number
  default     = 14 // Default retention period in days
}

variable "role_assignments" {
  description = "A map of role assignments for the CloudWatch resources."
  type        = map(string)
  default     = {
    "Engineer_Onshore"   = "arn:aws:iam::123456789012:role/EngineerRole",
    "Engineer_Offshore"  = "arn:aws:iam::123456789012:role/EngineerRole",
    "Analyst_Onshore"    = "arn:aws:iam::123456789012:role/AnalystRole",
    "Analyst_Offshore"   = "arn:aws:iam::123456789012:role/AnalystRole",
    "Operations_Onshore" = "arn:aws:iam::123456789012:role/OperationsRole",
    "Operations_Offshore" = "arn:aws:iam::123456789012:role/OperationsRole"
  } // Replace with actual role ARNs as needed
}

variable "environment" {
  description = "The environment for the CloudWatch resources (e.g., dev, test, prod)."
  type        = string
  default     = "dev" // Specify the environment
}

variable "log_group_name" {
  description = "The name of the CloudWatch log group."
  type        = string
  default     = "my-log-group"
}

variable "retention_in_days" {
  description = "The number of days to retain log events in the specified log group."
  type        = number
  default     = 14
}

variable "log_stream_name" {
  description = "The name of the CloudWatch log stream."
  type        = string
  default     = "my-log-stream"
}

variable "alarm_name" {
  description = "The name of the CloudWatch alarm."
  type        = string
  default     = "HighCPUAlarm"
}

variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = number
  default     = 1
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = number
  default     = 300
}

variable "cpu_threshold" {
  description = "The value against which the specified statistic is compared."
  type        = number
  default     = 80
}

variable "alarm_description" {
  description = "The description of the CloudWatch alarm."
  type        = string
  default     = "This alarm monitors high CPU utilization."
}

variable "instance_id" {
  description = "The ID of the EC2 instance."
  type        = string
  default     = "i-1234567890abcdef0"
}

variable "alarm_actions" {
  description = "The list of actions to execute when this alarm transitions into an ALARM state."
  type        = list(string)
  default     = []
}

variable "event_rule_name" {
  description = "The name of the CloudWatch event rule."
  type        = string
  default     = "MyEventRule"
}

variable "event_rule_description" {
  description = "The description of the CloudWatch event rule."
  type        = string
  default     = "This rule triggers on EC2 events."
}

variable "target_arn" {
  description = "The ARN of the target to invoke when this rule matches an event."
  type        = string
  default     = "arn:aws:lambda:us-east-1:123456789012:function:MyFunction"
}

variable "target_input" {
  description = "The input to the target invoked by the rule."
  type        = string
  default     = "{}"
}

variable "policy_arn" {
  description = "The ARN of the policy to attach to the role."
  type        = string
  default     = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}