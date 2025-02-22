resource "aws_emr_cluster" "data_engineering_cluster" {
  name          = var.emr_cluster_name
  release_label = var.release_label
  applications  = var.applications
  service_role  = aws_iam_role.emr_role.arn
  ec2_attributes {
    subnet_id = var.subnet_id
    instance_profile = aws_iam_instance_profile.emr_instance_profile.arn
    emr_managed_master_security_group = var.emr_security_group_ids[0]
    emr_managed_slave_security_group = var.emr_security_group_ids[1]
  }
  
  master_instance_group {
    instance_type = var.emr_instance_type
  }

  core_instance_group {
    instance_type = var.emr_instance_type
    instance_count = var.emr_instance_count
  }

  termination_protection = var.termination_protection

  bootstrap_action {
    name = "bootstrap"
    path = var.bootstrap_action_path
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_iam_role" "emr_role" {
  name = var.emr_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "elasticmapreduce.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "emr_role_policy" {
  policy_arn = var.emr_role_arn
  role       = aws_iam_role.emr_role.name
}

resource "aws_iam_instance_profile" "emr_instance_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.emr_role.name
}

resource "aws_iam_role_policy_attachment" "emr_instance_profile_policy" {
  policy_arn = var.emr_role_arn
  role       = aws_iam_instance_profile.emr_instance_profile.name
}

resource "aws_iam_role_policy_attachment" "role_assignments" {
  for_each = var.role_assignments
  policy_arn = each.value
  role       = aws_iam_role.emr_role.name
}