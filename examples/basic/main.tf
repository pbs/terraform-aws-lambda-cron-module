module "lambda_cron" {
  source = "../.."

  handler  = "main"
  filename = "../artifacts/handler.zip"
  runtime  = "go1.x"

  environment  = var.environment
  product      = var.product
  repo         = var.repo
  organization = var.organization
}
