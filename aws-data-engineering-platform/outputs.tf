output "cloudwatch_log_group_name" {
  value = module.cloudwatch.log_group_name
}

output "dynamodb_table_name" {
  value = module.dynamodb.table_name
}

output "emr_cluster_id" {
  value = module.emr.cluster_id
}

output "glue_catalog_database_name" {
  value = module.glue.catalog_database_name
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "secrets_manager_secret_name" {
  value = module.secrets_manager.secret_name
}

output "sqs_queue_url" {
  value = module.sqs.queue_url
}

output "step_function_arn" {
  value = module.step_functions.arn
}

output "lambda_function_name" {
  value = module.lambda.function_name
}