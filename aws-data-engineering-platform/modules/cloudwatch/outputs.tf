// File: /aws-data-engineering-platform/aws-data-engineering-platform/modules/cloudwatch/outputs.tf

output "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch Log Group created."
  value       = aws_cloudwatch_log_group.example.name
}

output "cloudwatch_alarm_name" {
  description = "The name of the CloudWatch Alarm created."
  value       = aws_cloudwatch_metric_alarm.example.alarm_name
}

output "cloudwatch_dashboard_name" {
  description = "The name of the CloudWatch Dashboard created."
  value       = aws_cloudwatch_dashboard.example.dashboard_name
}