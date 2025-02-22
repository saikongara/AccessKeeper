variable "glue_database_name" {
  description = "The name of the Glue database to be created."
  type        = string
  default     = "my_glue_database"
}

variable "glue_table_name" {
  description = "The name of the Glue table to be created."
  type        = string
  default     = "my_glue_table"
}

variable "table_location" {
  description = "The S3 location for the Glue table"
  type        = string
}

variable "glue_role_name" {
  description = "The name of the IAM role that Glue will assume."
  type        = string
  default     = "my_glue_role"
}

variable "glue_policy_arn" {
  description = "The ARN of the IAM policy to attach to the Glue role."
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

variable "glue_security_configuration" {
  description = "The name of the Glue security configuration to be used."
  type        = string
  default     = "my_glue_security_configuration"
}

variable "group_ids" {
  description = "A map of group IDs to assign roles for Glue resources."
  type        = map(string)
  default     = {
    Engineer_Onshore   = "group_id_1"
    Engineer_Offshore  = "group_id_2"
    Analyst_Onshore    = "group_id_3"
    Analyst_Offshore   = "group_id_4"
    Operations_Onshore = "group_id_5"
    Operations_Offshore = "group_id_6"
  }
}

variable "role_assignments" {
  description = "A map of role assignments for Glue resources."
  type        = map(string)
  default     = {
    Engineer_Onshore   = "AWSGlueServiceRole"
    Engineer_Offshore  = "AWSGlueServiceRole"
    Analyst_Onshore    = "AWSGlueServiceRole"
    Analyst_Offshore   = "AWSGlueServiceRole"
    Operations_Onshore = "AWSGlueServiceRole"
    Operations_Offshore = "AWSGlueServiceRole"
  }
}

variable "glue_job_name" {
  description = "The name of the Glue job to be created."
  type        = string
  default     = "my_glue_job"
}

variable "script_location" {
  description = "The S3 location of the Glue job script."
  type        = string
  default     = "s3://my-bucket/scripts/my-script.py"
}

variable "temp_dir" {
  description = "The temporary directory for Glue job."
  type        = string
  default     = "s3://my-bucket/temp/"
}

variable "glue_trigger_name" {
  description = "The name of the Glue trigger to be created."
  type        = string
  default     = "my_glue_trigger"
}

variable "trigger_schedule" {
  description = "The schedule for the Glue trigger."
  type        = string
  default     = "cron(0 12 * * ? *)"
}