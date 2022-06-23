variable "lambda_name" {
  description = "Name of the Lambda function"
  default     = null
  type        = string
}

variable "lambda_description" {
  description = "Description for this lambda function"
  default     = null
  type        = string
}

variable "role_arn" {
  description = "ARN of the role to be used for this Lambda"
  default     = null
  type        = string
}

variable "timeout" {
  description = "Timeout in seconds of the Lambda"
  default     = 3
  type        = number
}

variable "environment_vars" {
  description = "Map of environment variables for the Lambda. If null, defaults to setting an SSM_PATH based on the environment and name of the function. Set to {} if you would like for there to be no environment variables present. This is important if you are creating a Lambda@Edge."
  default     = null
  type        = map(any)
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime"
  default     = 128
  type        = number
}

variable "log_retention_in_days" {
  description = "Number of days to retain CloudWatch Log entries"
  default     = 7
  type        = number
}

variable "publish" {
  description = "Whether to publish creation/change as new Lambda Function Version"
  default     = true
  type        = bool
}

variable "policy_json" {
  description = "Policy JSON. If null, default policy granting access to SSM and cloudwatch logs is used"
  default     = null
  type        = string
}

variable "layers" {
  description = "Lambda layers to apply to function. If null, a Lambda Layer extension is added by default."
  default     = null
  type        = list(string)
}

variable "lambda_insights_version" {
  description = "Lambda layer version for the LambdaInsightsExtension layer"
  default     = 14
  type        = number
}

variable "tracing_config_mode" {
  description = "Tracing config mode for X-Ray integration on Lambda"
  default     = "Active"
  type        = string
  validation {
    condition     = contains(["Active", "PassThrough", "Disabled"], var.tracing_config_mode)
    error_message = "Valid configurations for X-Ray tracing config are 'Active' and 'PassThrough'. Setting this value to 'Disabled' disables X-Ray tracing."
  }
}
