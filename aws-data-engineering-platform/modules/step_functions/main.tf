resource "aws_iam_role" "step_functions_role" {
  name               = "step_functions_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "states.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

resource "aws_iam_policy" "step_functions_policy" {
  name        = "step_functions_policy"
  description = "Policy for Step Functions to access other AWS resources"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = var.policy_actions
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "step_functions_policy_attachment" {
  policy_arn = aws_iam_policy.step_functions_policy.arn
  role       = aws_iam_role.step_functions_role.name
}

resource "aws_stepfunctions_state_machine" "example" {
  name     = var.step_function_name
  role_arn = var.role_arn

  definition = var.definition
}

# Modified group membership resource to handle group permissions properly
resource "aws_iam_group_policy_attachment" "step_functions_group_policy" {
  for_each = toset(var.groups)

  group      = each.key
  policy_arn = aws_iam_policy.step_functions_policy.arn

  depends_on = [aws_iam_policy.step_functions_policy]
}