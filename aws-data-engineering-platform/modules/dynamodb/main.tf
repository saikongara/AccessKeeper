resource "aws_dynamodb_table" "data_engineering_table" {
  name         = var.table_name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }

  tags = var.tags

  // Provisioned throughput settings
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  // Enable server-side encryption
  server_side_encryption {
    enabled = true
  }
}

resource "aws_iam_role" "dynamodb_role" {
  name = "${var.role_name}-dynamodb-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "dynamodb.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

resource "aws_iam_policy" "dynamodb_policy" {
  name        = "${var.role_name}-dynamodb-policy"
  description = "Policy for accessing DynamoDB"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:Scan",
          "dynamodb:Query"
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.data_engineering_table.arn
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "dynamodb_role_policy_attachment" {
  role       = aws_iam_role.dynamodb_role.name
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}

resource "aws_iam_role_policy_attachment" "group_role_attachment" {
  count      = length(var.group_ids)
  role       = aws_iam_role.dynamodb_role.name
  policy_arn = aws_iam_policy.dynamodb_policy.arn
  depends_on = [aws_iam_role.dynamodb_role]
}