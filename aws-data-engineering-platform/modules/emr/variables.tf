variable "emr_cluster_name" {
  description = "The name of the EMR cluster."
  type        = string
  default     = "my-emr-cluster"
}

variable "emr_instance_type" {
  description = "The EC2 instance type for the EMR cluster."
  type        = string
  default     = "m5.xlarge"
}

variable "emr_instance_count" {
  description = "The number of instances in the EMR cluster."
  type        = number
  default     = 3
}

variable "emr_role_arn" {
  description = "The ARN of the IAM role to be used by the EMR cluster."
  type        = string
  default     = "arn:aws:iam::123456789012:role/MyEMRRole"
}

variable "emr_security_group_ids" {
  description = "A list of security group IDs to associate with the EMR cluster."
  type        = list(string)
  default     = ["sg-0123456789abcdef0", "sg-0123456789abcdef1"]
}

variable "role_assignments" {
  description = "A map of role assignments for the EMR cluster."
  type        = map(string)
  default     = {
    "Engineer_Onshore"   = "arn:aws:iam::123456789012:role/EngineerRole"
    "Engineer_Offshore"  = "arn:aws:iam::123456789012:role/EngineerRole"
    "Analyst_Onshore"    = "arn:aws:iam::123456789012:role/AnalystRole"
    "Analyst_Offshore"   = "arn:aws:iam::123456789012:role/AnalystRole"
    "Operations_Onshore" = "arn:aws:iam::123456789012:role/OperationsRole"
    "Operations_Offshore" = "arn:aws:iam::123456789012:role/OperationsRole"
  }
}

variable "release_label" {
  description = "The EMR release label."
  type        = string
}

variable "applications" {
  description = "A list of applications for the EMR cluster."
  type        = list(string)
}

variable "subnet_id" {
  description = "The subnet ID for the EMR cluster."
  type        = string
}

variable "termination_protection" {
  description = "Whether to enable termination protection for the EMR cluster."
  type        = bool
  default     = false
}

variable "bootstrap_action_path" {
  description = "The S3 path to the bootstrap action script."
  type        = string
}

variable "environment" {
  description = "The environment tag for the EMR cluster."
  type        = string
}

variable "emr_role_name" {
  description = "The name of the IAM role for the EMR cluster."
  type        = string
}

variable "instance_profile_name" {
  description = "The name of the instance profile for the EMR cluster."
  type        = string
}