module "lambda" {
  source = "github.com/pbs/terraform-aws-lambda-module?ref=0.0.2"

  # Required
  handler  = var.handler
  filename = var.filename
  runtime  = var.runtime

  # Optional
  name                    = local.lambda_name
  description             = var.lambda_description
  role_arn                = var.role_arn
  timeout                 = var.timeout
  environment_vars        = var.environment_vars
  memory_size             = var.memory_size
  log_retention_in_days   = var.log_retention_in_days
  publish                 = var.publish
  policy_json             = var.policy_json
  layers                  = var.layers
  lambda_insights_version = var.lambda_insights_version
  tracing_config_mode     = var.tracing_config_mode

  # Tags
  environment  = var.environment
  product      = var.product
  repo         = var.repo
  organization = var.organization
}
