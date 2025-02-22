resource "aws_cloudwatch_log_group" "this" {
  name              = var.log_group_name
  retention_in_days = var.retention_in_days

  tags = {
    Environment = var.environment
  }
}

resource "aws_cloudwatch_log_stream" "this" {
  name           = var.log_stream_name
  log_group_name = aws_cloudwatch_log_group.this.name
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = var.period
  statistic          = "Average"
  threshold          = var.cpu_threshold
  alarm_description  = var.alarm_description

  dimensions = {
    InstanceId = var.instance_id
  }

  alarm_actions = var.alarm_actions
}

resource "aws_cloudwatch_event_rule" "this" {
  name        = var.event_rule_name
  description = var.event_rule_description
  event_pattern = jsonencode({
    "source" = ["aws.ec2"]
  })
}

resource "aws_cloudwatch_event_target" "this" {
  rule      = aws_cloudwatch_event_rule.this.name
  arn       = var.target_arn
  input     = var.target_input
}

resource "aws_iam_role" "cloudwatch_role" {
  name               = "CloudWatchRole"
  assume_role_policy = data.aws_iam_policy_document.cloudwatch_assume_role_policy.json
}

resource "aws_iam_policy_attachment" "cloudwatch_policy_attachment" {
  name       = "CloudWatchPolicyAttachment"
  roles      = [aws_iam_role.cloudwatch_role.name]
  policy_arn = var.policy_arn
}

resource "aws_iam_role_policy_attachment" "role_assignments" {
  for_each = var.role_assignments
  policy_arn = each.value
  role       = aws_iam_role.cloudwatch_role.name
}

data "aws_iam_policy_document" "cloudwatch_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["logs.amazonaws.com"]
    }
  }
}