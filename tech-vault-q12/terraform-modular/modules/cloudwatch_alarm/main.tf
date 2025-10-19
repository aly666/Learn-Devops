resource "aws_cloudwatch_metric_alarm" "unauthorized_api_calls" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "UnauthorizedApiCalls"
  namespace           = "AWS/CloudTrail"
  period              = 300
  statistic           = "Sum"
  threshold           = 0
  alarm_description   = "Trigger if unauthorized API calls occur"
  actions_enabled     = true

  alarm_actions = var.alarm_actions
}

