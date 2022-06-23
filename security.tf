resource "aws_lambda_permission" "allow_event_invocation" {
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.event_rule.arn
}
