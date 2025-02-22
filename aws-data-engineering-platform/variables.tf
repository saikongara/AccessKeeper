variable "aws_region" {
  description = "The AWS region where the resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "groups" {
  description = "List of IAM groups to be managed"
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

variable "role_assignments" {
  description = "Map of groups to their assigned IAM policies (both managed policies and policy ARNs)"
  type        = map(list(string))
  default = {
    Engineer_Onshore   = ["AWSGlueConsoleFullAccess", "AmazonS3FullAccess", "arn:aws:iam::aws:policy/AdministratorAccess"]
    Engineer_Offshore  = ["AWSGlueConsoleFullAccess", "AmazonS3ReadOnlyAccess", "arn:aws:iam::aws:policy/PowerUserAccess"]
    Analyst_Onshore    = ["AmazonAthenaFullAccess", "AmazonS3ReadOnlyAccess", "arn:aws:iam::aws:policy/ReadOnlyAccess"]
    Analyst_Offshore   = ["AmazonAthenaFullAccess", "AmazonS3ReadOnlyAccess", "arn:aws:iam::aws:policy/ReadOnlyAccess"]
    Operations_Onshore = ["AWSGlueConsoleFullAccess", "AmazonEMRFullAccessPolicy_v2", "arn:aws:iam::aws:policy/AdministratorAccess"]
    Operations_Offshore = ["AWSGlueConsoleReadOnlyAccess", "arn:aws:iam::aws:policy/PowerUserAccess"]
  }
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EMR cluster"
  type        = string
}

variable "emr_master_security_group" {
  description = "Security group ID for EMR master node"
  type        = string
}

variable "emr_slave_security_group" {
  description = "Security group ID for EMR slave nodes"
  type        = string
}