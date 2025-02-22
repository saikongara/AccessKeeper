// File: /aws-data-engineering-platform/aws-data-engineering-platform/modules/glue/outputs.tf

output "glue_catalog_id" {
  description = "The ID of the Glue Data Catalog."
  value       = aws_glue_catalog_database.this.catalog_id
}

output "glue_database_name" {
  description = "The name of the Glue database created."
  value       = aws_glue_catalog_database.this.name
}

output "glue_table_name" {
  description = "The name of the Glue table created."
  value       = aws_glue_catalog_table.this.name
}

output "glue_job_name" {
  description = "The name of the Glue job created."
  value       = aws_glue_job.this.name
}

output "glue_trigger_name" {
  description = "The name of the Glue trigger created."
  value       = aws_glue_trigger.this.name
}