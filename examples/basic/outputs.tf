output "lambda_arn" {
  description = "Lambda ARN"
  value       = module.lambda_cron.lambda_arn
}

output "cron" {
  description = "Cron"
  value       = module.lambda_cron.cron
}
