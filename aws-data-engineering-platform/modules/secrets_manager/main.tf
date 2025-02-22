resource "aws_secretsmanager_secret" "example" {
  name        = var.secret_name
  description = var.description
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = aws_secretsmanager_secret.example.id
  secret_string = var.secret_value
}

resource "aws_iam_role" "secrets_manager_role" {
  name = "secrets_manager_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "secrets_manager_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.secrets_manager_role.name
}

resource "aws_iam_role_policy_attachment" "secrets_manager_access" {
  count      = length(var.group_ids)
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
  role       = element(var.group_ids, count.index)
  depends_on = [aws_secretsmanager_secret.example]
}

output "secret_arn" {
  value = aws_secretsmanager_secret.example.arn
}

output "secret_name" {
  value = aws_secretsmanager_secret.example.name
}