// File: /aws-data-engineering-platform/aws-data-engineering-platform/modules/secrets_manager/outputs.tf

output "secrets_manager_arn" {
  description = "The ARN of the created Secrets Manager secret."
  value       = aws_secretsmanager_secret.example.secret_arn
}

output "secrets_manager_name" {
  description = "The name of the created Secrets Manager secret."
  value       = aws_secretsmanager_secret.example.name
}

output "secrets_manager_version_id" {
  description = "The version ID of the created Secrets Manager secret."
  value       = aws_secretsmanager_secret_version.example.version_id
}