resource "aws_cloudwatch_event_rule" "event_rule" {
  name                = local.event_rule_name
  description         = local.event_rule_description
  schedule_expression = "cron(${var.cron})"
  is_enabled          = var.is_enabled

  tags = local.tags
}

resource "aws_cloudwatch_event_target" "event_target" {
  rule = aws_cloudwatch_event_rule.event_rule.id
  arn  = module.lambda.arn
}
