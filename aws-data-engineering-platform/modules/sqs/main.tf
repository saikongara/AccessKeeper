resource "aws_sqs_queue" "data_engineering_queue" {
  name                      = var.queue_name
  delay_seconds             = var.delay_seconds
  max_message_size          = var.max_message_size
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_sqs_queue_policy" "data_engineering_queue_policy" {
  queue_url = aws_sqs_queue.data_engineering_queue.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "SQS:SendMessage"
        Resource = aws_sqs_queue.data_engineering_queue.arn
        Condition = {
          StringEquals = {
            "aws:SourceArn" = var.source_arn
          }
        }
      }
    ]
  })
}

resource "aws_iam_role" "sqs_role" {
  name = "${var.project_name}-sqs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "sqs.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "sqs_policy_attachment" {
  policy_arn = var.role_assignments["Engineer_Onshore"]
  role       = aws_iam_role.sqs_role.name
}