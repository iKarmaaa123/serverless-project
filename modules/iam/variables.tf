variable lambda_execution_role_name {
  type        = string
  description = "Lambda execution role name"
}

variable lambda_logging_policy_name {
  type        = string
  description = "Policy name for logging iam policy for lambda execution role"
}

variable lambda_dynamodb_policy_name {
  type        = string
  description = "Policy name for dynamodb iam policy for lambda execution role"
}

variable "lambda_function_arn" {
  type = string
  description = "function arn for lambda"
}