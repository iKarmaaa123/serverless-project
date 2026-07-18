variable "eventbridge_pipes_cloudwatch_log_group_arn" {
  type        = string
  description = "Arn for eventbridge pipes cloudwatch log group"
}

variable "dynamodb_table_arn" {
  type        = string
  description = "Arn for DynamoDB table"
}

variable "dynamodb_table_stream_arn" {
  type        = string
  description = "Arn for DynamoDB table stream"
}

variable "s3_bucket_arn" {
  type        = string
  description = "Arn for S3 bucket"
}

variable "event_bus_arn" {
  type        = string
  description = "Arn for eventbus"
}

variable "sqs_queue_arn" {
  type        = string
  description = "Arn for sqs queue"
}

variable "logging_policy_name" {
  type        = string
  description = "Policy name for logging IAM policy"
}

variable "dynamodb_policy_name" {
  type        = string
  description = "Policy name for DynamoDB IAM policy"
}

variable "dynamodb_streams_policy_name" {
  type        = string
  description = "Name for DynamoDB streams IAM policy"
}

variable "s3_policy_name" {
  type        = string
  description = "Policy name for S3 IAM policy for lambda execution role"
}

variable "eventbridge_policy_name" {
  type        = string
  description = "Policy name for eventbridge IAM policy"
}

variable "sqs_policy_name" {
  type        = string
  description = "Policy name for sqs IAM policy"
}

variable "lambda_dynamodb_role_name" {
  type        = string
  description = "Name for lambda dynamodb function role name"
}

variable "lambda_s3_role_name" {
  type        = string
  description = "Name for lambda s3 function role name"
}