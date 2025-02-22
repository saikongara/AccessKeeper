// filepath: /aws-data-engineering-platform/aws-data-engineering-platform/modules/s3/variables.tf
variable "bucket_name" {
  description = "The name of the S3 bucket to create. Must be globally unique."
  type        = string
  default     = "my-data-engineering-platform-bucket"
}

variable "region" {
  description = "The AWS region where the S3 bucket will be created."
  type        = string
  default     = "us-east-1"
}

variable "acl" {
  description = "The canned ACL to apply to the bucket."
  type        = string
  default     = "private"
}

variable "versioning_enabled" {
  description = "Enable versioning on the S3 bucket."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the S3 bucket."
  type        = map(string)
  default     = {
    Environment = "Development"
    Project     = "Data Engineering"
  }
}

variable "role_assignments" {
  description = "A map of role assignments for the specified groups."
  type        = map(string)
  default     = {
    Engineer_Onshore   = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    Engineer_Offshore  = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    Analyst_Onshore    = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    Analyst_Offshore   = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    Operations_Onshore = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    Operations_Offshore = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  }
}

variable "group_ids" {
  description = "A list of AWS IAM group IDs to assign to the bucket policy."
  type        = list(string)
  default     = []
}