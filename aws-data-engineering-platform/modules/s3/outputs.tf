// File: /aws-data-engineering-platform/aws-data-engineering-platform/modules/s3/outputs.tf

output "s3_bucket_name" {
  description = "The name of the S3 bucket created for the Data Engineering Platform."
  value       = aws_s3_bucket.data_engineering_bucket.bucket
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket created for the Data Engineering Platform."
  value       = aws_s3_bucket.data_engineering_bucket.arn
}

output "s3_bucket_domain_name" {
  description = "The domain name of the S3 bucket created for the Data Engineering Platform."
  value       = aws_s3_bucket.data_engineering_bucket.bucket_domain_name
}