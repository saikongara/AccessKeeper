// filepath: /aws-data-engineering-platform/aws-data-engineering-platform/modules/lambda/outputs.tf
output "lambda_function_arn" {
  description = "The ARN of the created Lambda function."
  value       = aws_lambda_function.my_lambda_function.arn
}

output "lambda_function_name" {
  description = "The name of the created Lambda function."
  value       = aws_lambda_function.my_lambda_function.function_name
}

output "lambda_function_version" {
  description = "The version of the created Lambda function."
  value       = aws_lambda_function.my_lambda_function.version
}