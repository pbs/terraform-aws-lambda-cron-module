variable "event_rule_name" {
  description = "Name of the CloudWatch Event Rule. Will default to name if not defined."
  default     = null
  type        = string
}

variable "event_rule_description" {
  description = "Value to use for the CloudWatch Event Rule. Will default to name if not defined."
  default     = null
  type        = string
}

variable "cron" {
  description = "(optional) cron controlling schedule of task. Is set to 07:00 GMT (02:00 EST) by default."
  default     = "00 7 * * ? *"
  type        = string
}

variable "is_enabled" {
  description = "(optional) whether the rule is enabled. Is set to true by default."
  default     = true
  type        = bool
}
