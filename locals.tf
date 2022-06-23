locals {
  name = var.name != null ? var.name : var.product

  lambda_name = var.lambda_name != null ? var.lambda_name : local.name

  event_rule_name        = var.event_rule_name != null ? var.event_rule_name : local.name
  event_rule_description = var.event_rule_description != null ? var.event_rule_description : local.name

  creator = "terraform"

  tags = merge(
    var.tags,
    {
      Name                                      = local.name
      "${var.organization}:billing:product"     = var.product
      "${var.organization}:billing:environment" = var.environment
      creator                                   = local.creator
      repo                                      = var.repo
    }
  )
}
