output "lambda_arn" {
  description = "ARN of the lambda"
  value       = module.lambda.arn
}

output "cron" {
  description = "Cron expression"
  value       = var.cron
}
