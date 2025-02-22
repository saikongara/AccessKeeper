// This file defines the outputs for the Step Functions module.

output "step_function_arn" {
  description = "The ARN of the created Step Function."
  value       = aws_step_function.example.arn
}

output "step_function_name" {
  description = "The name of the created Step Function."
  value       = aws_step_function.example.name
}