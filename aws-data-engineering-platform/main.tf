# Variables declaration
variable "aws_region" {}
variable "environment" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "key_name" {}
variable "s3_bucket_name" {}
variable "dynamodb_table_name" {}
variable "emr_cluster_name" {}
variable "glue_database_name" {}
variable "lambda_function_name" {}
variable "sqs_queue_name" {}
variable "step_functions_name" {}
variable "cloudwatch_log_group_name" {}
variable "secrets_manager_secret_name" {}
variable "emr_master_security_group" {}
variable "emr_slave_security_group" {}
variable "account_id" {}
variable "groups" {
  type = list(string)
}
variable "role_assignments" {
  type = map(list(string))
}

# Provider configuration
provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "data_engineering_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = "Data Engineering Platform Bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.data_engineering_bucket.id
  acl    = "private"
}

resource "aws_dynamodb_table" "data_engineering_table" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name        = "Data Engineering Table"
    Environment = var.environment
  }
}

# EMR IAM Roles and Policies
resource "aws_iam_role" "emr_service_role" {
  name = "EMRServiceRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "elasticmapreduce.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "emr_service_role_policy" {
  role       = aws_iam_role.emr_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceRole"
}

resource "aws_iam_role" "emr_ec2_role" {
  name = "EMR_EC2_Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "emr_ec2_role_policy" {
  role       = aws_iam_role.emr_ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonElasticMapReduceforEC2Role"
}

resource "aws_iam_instance_profile" "emr_ec2_profile" {
  name = "EMR_EC2_Profile"
  role = aws_iam_role.emr_ec2_role.name
}

resource "aws_emr_cluster" "data_engineering_emr" {
  name          = var.emr_cluster_name
  release_label = "emr-6.3.0"
  applications  = ["Hadoop", "Spark"]
  service_role  = aws_iam_role.emr_service_role.arn

  ec2_attributes {
    subnet_id                         = var.subnet_id
    emr_managed_master_security_group = var.emr_master_security_group
    emr_managed_slave_security_group  = var.emr_slave_security_group
    instance_profile                  = aws_iam_instance_profile.emr_ec2_profile.arn
    key_name                          = var.key_name
  }

  tags = {
    Name        = "Data Engineering EMR Cluster"
    Environment = var.environment
  }
}

resource "aws_glue_catalog_database" "data_engineering_glue_db" {
  name = var.glue_database_name

  tags = {
    Name        = "Data Engineering Glue Database"
    Environment = var.environment
  }
}

# Lambda role and permissions
resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "data_engineering_lambda" {
  function_name = var.lambda_function_name
  s3_bucket     = aws_s3_bucket.data_engineering_bucket.bucket
  s3_key        = "lambda_function.zip"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = aws_iam_role.lambda_role.arn

  tags = {
    Name        = "Data Engineering Lambda Function"
    Environment = var.environment
  }
}

resource "aws_sqs_queue" "data_engineering_queue" {
  name = var.sqs_queue_name

  tags = {
    Name        = "Data Engineering SQS Queue"
    Environment = var.environment
  }
}

# Step Functions role
resource "aws_iam_role" "step_functions_role" {
  name = "StepFunctionsExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "states.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_stepfunctions_state_machine" "data_engineering_step_function" {
  name     = var.step_functions_name
  role_arn = aws_iam_role.step_functions_role.arn

  definition = jsonencode({
    Comment = "Data Engineering State Machine"
    StartAt = "ProcessData"
    States = {
      ProcessData = {
        Type = "Pass"
        End  = true
      }
    }
  })

  tags = {
    Name        = "Data Engineering Step Function"
    Environment = var.environment
  }
}

resource "aws_cloudwatch_log_group" "data_engineering_log_group" {
  name = var.cloudwatch_log_group_name

  retention_in_days = 14

  tags = {
    Name        = "Data Engineering Log Group"
    Environment = var.environment
  }
}

resource "aws_secretsmanager_secret" "data_engineering_secret" {
  name        = var.secrets_manager_secret_name
  description = "Secret for Data Engineering Platform"

  tags = {
    Name        = "Data Engineering Secret"
    Environment = var.environment
  }
}

# Group IAM configuration
resource "aws_iam_role" "group_roles" {
  for_each = var.role_assignments

  name = "${each.key}_Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${var.account_id}:root"
        }
      }
    ]
  })

  tags = {
    Name        = "${each.key} Role"
    Environment = var.environment
  }
}

resource "aws_iam_role_policy_attachment" "group_policy_attachments" {
  for_each = {
    for pair in flatten([
      for group, policies in var.role_assignments : [
        for policy in policies : {
          group  = group
          policy = policy
        }
      ]
    ]) : "${pair.group}-${pair.policy}" => pair
  }

  role       = aws_iam_role.group_roles[each.value.group].name
  policy_arn = "arn:aws:iam::aws:policy/${each.value.policy}"
}

resource "aws_iam_group" "groups" {
  for_each = toset(var.groups)
  name     = each.value
}

resource "aws_iam_group_policy" "assume_role_policy" {
  for_each = aws_iam_group.groups

  name  = "${each.value.name}-assume-role-policy"
  group = each.value.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Resource = aws_iam_role.group_roles[each.value.name].arn
      }
    ]
  })
}