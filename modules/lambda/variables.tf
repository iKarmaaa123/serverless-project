variable "role" {
  type = string
  description = "IAM role for lambda function"
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

variable "apigateway_action" {
  type = string
  description = "What lambda action to allow"
}

variable "apigateway_principle" {
  type = string
  description = "AWS service that is going to invoke lambda function"
}

variable "source_arn" {
  type = string
  description = "ARN of the source resource granting permission to invoke the Lambda function"
}