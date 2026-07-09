variable "lambda_dynamodb_function_role" {
  type = string
  description = "IAM role for lambda dynamodb function"
}

variable "lambda_s3_function_role" {
  type = string
  description = "IAM role for lambda s3 function"
}

variable "dynamodb_lambda_function_name" {
  type = string
  description = "Name of dynamodb lambda function"
}

variable "s3_lambda_function_name" {
  type = string
  description = "Name of s3 lambda function"
}

variable "method_type" {
  type = string
  description = "Method of archiving fie"
}

variable "dynamodb_function_handler" {
  type = string
  description = "DynamoDB lambda function's entry point"
}

variable "s3_function_handler" {
  type = string
  description = "S3 lambda function's entry point"
}

variable "runtime" {
  type = string
  description = "Runtime the lambda is going to use when executing code"
}

variable "timeout" {
  type = number
  description = "Value for when lambda function should stop running"
}

variable "apigateway_statement_id" {
  type = string
  description = "Statement identifiers"
}

variable "eventbridge_statement_id" {
  type = string
  description = "Statement identifiers"
}

variable "invoke_action" {
  type = string
  description = "What action to allow for the resource over the lambda function"
}

variable "apigateway_principle" {
  type = string
  description = "AWS service that is going to invoke lambda function"
}

variable "eventbridge_principle" {
  type = string
  description = "AWS service that is going to invoke lambda function"
}

variable "api_gateway_source_arn" {
  type = string
  description = "ARN for the api gateway resource granting permission to invoke the lambda function"
}

variable "event_bus_rule_source_arn" {
  type = string
  description = "ARN for the event bus rule to grant it permission to invoke the lambda function"
}

variable "dead_letter_queue" {
  type = string
  description = "Arn for sqs dead letter queue"
}