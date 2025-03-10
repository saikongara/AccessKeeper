// File: /aws-data-engineering-platform/aws-data-engineering-platform/modules/sqs/outputs.tf

output "sqs_queue_url" {
  description = "The URL of the created SQS queue."
  value       = aws_sqs_queue.my_queue.id
}

output "sqs_queue_arn" {
  description = "The ARN of the created SQS queue."
  value       = aws_sqs_queue.my_queue.arn
}

output "sqs_queue_name" {
  description = "The name of the created SQS queue."
  value       = aws_sqs_queue.my_queue.name
}