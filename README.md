# PBS TF Lambda Cron Module

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-lambda-cron-module?ref=0.1.44
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

Lambda function that is triggered by a CloudWatch Event Rule based on a cron expression.

Integrate this module like so:

```hcl
module "lambda-cron" {
  source = "github.com/pbs/terraform-aws-lambda-cron-module?ref=0.1.44"

  # Required Parameters
  handler  = "main"
  filename = "../artifacts/handler.zip"
  runtime  = "go1.x"

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
  cron = "05 20 * * ? *"
}
```

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`0.1.44`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.35.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lambda"></a> [lambda](#module\_lambda) | github.com/pbs/terraform-aws-lambda-module | 1.3.40 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.event_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.event_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_lambda_permission.allow_event_invocation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_default_tags.common_tags](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/default_tags) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (sharedtools, dev, staging, qa, prod) | `string` | n/a | yes |
| <a name="input_filename"></a> [filename](#input\_filename) | Filename for the artifact to use for the Lambda | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | Cloudwatch event pattern | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Organization using this module. Used to prefix tags so that they are easily identified as being from your organization | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | Tag used to group resources according to product | `string` | n/a | yes |
| <a name="input_repo"></a> [repo](#input\_repo) | Tag used to point to the repo using this module | `string` | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Runtime for the lambda function | `string` | n/a | yes |
| <a name="input_add_app_config_extension_layer"></a> [add\_app\_config\_extension\_layer](#input\_add\_app\_config\_extension\_layer) | Add the AWS-AppConfig-Lambda-Extension layer to the Lambda function. Ignored if layers is not null or if `image_uri` is defined. | `bool` | `true` | no |
| <a name="input_add_ssm_extension_layer"></a> [add\_ssm\_extension\_layer](#input\_add\_ssm\_extension\_layer) | Add the AWS-Parameters-and-Secrets-Lambda-Extension layer to the Lambda function. Ignored if layers is not null or if `image_uri` is defined. | `bool` | `true` | no |
| <a name="input_add_vpc_config"></a> [add\_vpc\_config](#input\_add\_vpc\_config) | Add VPC configuration to the Lambda function | `bool` | `false` | no |
| <a name="input_allow_app_config_access"></a> [allow\_app\_config\_access](#input\_allow\_app\_config\_access) | Allow AppConfig access from the Lambda function. Ignored if `policy_json` or `role_arn` are set. | `bool` | `true` | no |
| <a name="input_app_config_extension_account_number"></a> [app\_config\_extension\_account\_number](#input\_app\_config\_extension\_account\_number) | Account number for the AWS-AppConfig-Extension layer | `string` | `"027255383542"` | no |
| <a name="input_app_config_extension_version"></a> [app\_config\_extension\_version](#input\_app\_config\_extension\_version) | Lambda layer version for the AWS-AppConfig-Extension layer | `number` | `null` | no |
| <a name="input_architectures"></a> [architectures](#input\_architectures) | Architectures to target for the Lambda function | `list(string)` | <pre>[<br>  "x86_64"<br>]</pre> | no |
| <a name="input_cron"></a> [cron](#input\_cron) | (optional) cron controlling schedule of task. Is set to 07:00 GMT (02:00 EST) by default. | `string` | `"00 7 * * ? *"` | no |
| <a name="input_environment_vars"></a> [environment\_vars](#input\_environment\_vars) | Map of environment variables for the Lambda. If null, defaults to setting an SSM\_PATH based on the environment and name of the function. Set to {} if you would like for there to be no environment variables present. This is important if you are creating a Lambda@Edge. | `map(any)` | `null` | no |
| <a name="input_ephemeral_storage_size"></a> [ephemeral\_storage\_size](#input\_ephemeral\_storage\_size) | Size of the ephemeral storage in MB. Ignored if runtime is not supported. | `number` | `512` | no |
| <a name="input_event_rule_description"></a> [event\_rule\_description](#input\_event\_rule\_description) | Value to use for the CloudWatch Event Rule. Will default to name if not defined. | `string` | `null` | no |
| <a name="input_event_rule_name"></a> [event\_rule\_name](#input\_event\_rule\_name) | Name of the CloudWatch Event Rule. Will default to name if not defined. | `string` | `null` | no |
| <a name="input_file_system_config"></a> [file\_system\_config](#input\_file\_system\_config) | File system configuration for the Lambda function | `map(any)` | `null` | no |
| <a name="input_is_enabled"></a> [is\_enabled](#input\_is\_enabled) | (optional) whether the rule is enabled. Is set to true by default. | `bool` | `true` | no |
| <a name="input_lambda_description"></a> [lambda\_description](#input\_lambda\_description) | Description for this lambda function | `string` | `null` | no |
| <a name="input_lambda_insights_extension_account_number"></a> [lambda\_insights\_extension\_account\_number](#input\_lambda\_insights\_extension\_account\_number) | Account number for the LambdaInsightsExtension layer | `string` | `"580247275435"` | no |
| <a name="input_lambda_insights_extension_version"></a> [lambda\_insights\_extension\_version](#input\_lambda\_insights\_extension\_version) | Lambda layer version for the LambdaInsightsExtension layer | `number` | `null` | no |
| <a name="input_lambda_name"></a> [lambda\_name](#input\_lambda\_name) | Name of the Lambda function | `string` | `null` | no |
| <a name="input_layers"></a> [layers](#input\_layers) | Lambda layers to apply to function. If null, a Lambda Layer extension is added by default. | `list(string)` | `null` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Number of days to retain CloudWatch Log entries | `number` | `7` | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | Amount of memory in MB your Lambda Function can use at runtime | `number` | `128` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Lambda Cron Module. If null, will default to product. | `string` | `null` | no |
| <a name="input_package_type"></a> [package\_type](#input\_package\_type) | Package type for the Lambda function. Valid values are Zip and Image. | `string` | `"Zip"` | no |
| <a name="input_parameters_and_secrets_extension_account_number"></a> [parameters\_and\_secrets\_extension\_account\_number](#input\_parameters\_and\_secrets\_extension\_account\_number) | Account number for the AWS-Parameters-and-Secrets-Lambda-Extension layer | `string` | `"177933569100"` | no |
| <a name="input_parameters_and_secrets_extension_version"></a> [parameters\_and\_secrets\_extension\_version](#input\_parameters\_and\_secrets\_extension\_version) | Lambda layer version for the AWS-Parameters-and-Secrets-Lambda-Extension layer | `number` | `null` | no |
| <a name="input_permissions_boundary_arn"></a> [permissions\_boundary\_arn](#input\_permissions\_boundary\_arn) | ARN of the permissions boundary to use on the role created for this lambda | `string` | `null` | no |
| <a name="input_policy_json"></a> [policy\_json](#input\_policy\_json) | Policy JSON. If null, default policy granting access to SSM and cloudwatch logs is used | `string` | `null` | no |
| <a name="input_publish"></a> [publish](#input\_publish) | Whether to publish creation/change as new Lambda Function Version | `bool` | `true` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | ARN of the role to be used for this Lambda | `string` | `null` | no |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | Security group ID. If null, one will be created. | `string` | `null` | no |
| <a name="input_ssm_path"></a> [ssm\_path](#input\_ssm\_path) | SSM path to use for environment variables. If null, defaults to /${var.environment}/${local.name} | `string` | `null` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets to use for the Lambda function. Ignored if add\_vpc\_config is false. If null, one will be looked up based on environment tag. | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Extra tags | `map(string)` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Timeout in seconds of the Lambda | `number` | `3` | no |
| <a name="input_tracing_config_mode"></a> [tracing\_config\_mode](#input\_tracing\_config\_mode) | Tracing config mode for X-Ray integration on Lambda | `string` | `"Active"` | no |
| <a name="input_use_prefix"></a> [use\_prefix](#input\_use\_prefix) | Use prefix for resources instead of explicitly defining whole name where possible | `bool` | `true` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID. If null, one will be looked up based on environment tag. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cron"></a> [cron](#output\_cron) | Cron expression |
| <a name="output_lambda_arn"></a> [lambda\_arn](#output\_lambda\_arn) | ARN of the lambda |
