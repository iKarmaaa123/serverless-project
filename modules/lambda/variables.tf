variable "role" {
  type = string
  description = "IAM role for lambda function"
}

variable "function_name_dynamdb" {
  type = string
  description = "Name of lambda function for dynamodb lambda function"
}

variable "method_type" {
  type = string
  description = "Method of archiving fie"
}

variable "handler" {
  type = string
  description = "Function entry point in your code"
}

variable "runtime" {
  type = string
  description = "Runtime the lambda is going to use when executing code"
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