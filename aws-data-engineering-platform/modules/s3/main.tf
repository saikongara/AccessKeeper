resource "aws_s3_bucket" "data_engineering_bucket" {
  bucket = var.bucket_name
  tags = var.tags
}

resource "aws_s3_bucket_acl" "data_engineering_bucket_acl" {
  bucket = aws_s3_bucket.data_engineering_bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_policy" "data_engineering_bucket_policy" {
  bucket = aws_s3_bucket.data_engineering_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.group_ids
        }
        Action = "s3:*"
        Resource = [
          "${aws_s3_bucket.data_engineering_bucket.arn}/*",
          aws_s3_bucket.data_engineering_bucket.arn
        ]
      }
    ]
  })
}