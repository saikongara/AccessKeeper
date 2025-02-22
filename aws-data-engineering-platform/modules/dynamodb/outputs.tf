output "dynamodb_table_name" {
  description = "The name of the DynamoDB table created."
  value       = aws_dynamodb_table.data_engineering_table.name
}

output "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table created."
  value       = aws_dynamodb_table.data_engineering_table.arn
}

output "dynamodb_table_stream_arn" {
  description = "The ARN of the DynamoDB table stream, if enabled."
  value       = aws_dynamodb_table.data_engineering_table.latest_stream_arn
}