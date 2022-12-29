module "lambda" {
  source = "github.com/pbs/terraform-aws-lambda-module?ref=1.3.0"

  # Required
  handler  = var.handler
  filename = var.filename
  runtime  = var.runtime

  # Optional
  name                     = local.lambda_name
  description              = var.lambda_description
  role_arn                 = var.role_arn
  timeout                  = var.timeout
  environment_vars         = var.environment_vars
  memory_size              = var.memory_size
  log_retention_in_days    = var.log_retention_in_days
  publish                  = var.publish
  policy_json              = var.policy_json
  layers                   = var.layers
  tracing_config_mode      = var.tracing_config_mode
  architectures            = var.architectures
  permissions_boundary_arn = var.permissions_boundary_arn
  use_prefix               = var.use_prefix
  file_system_config       = var.file_system_config
  vpc_id                   = var.vpc_id
  add_vpc_config           = var.add_vpc_config
  security_group_id        = var.security_group_id
  subnets                  = var.subnets

  # Tags
  environment  = var.environment
  product      = var.product
  repo         = var.repo
  organization = var.organization
}
