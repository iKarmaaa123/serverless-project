variable "env" {
    type = string
    description = "Environment to deploy to"
}

variable "api_gateway_name" {
    type = string
    description = "Name of api gateway"
}

variable "path_part" {
    type = string
    description = "path that api supports"
}

# variable "uri" {
#     type = string
#     description = "uri of lambda function to trigger when api gateway receives POST request"
# }

variable "http_method" {
    type = string
    description = "http method that rest api supports" 
}

variable "authorization" {
    type = string
    description = "Authorization for sending request to REST api"
}

variable "integration_input_type" {
    type = string
    description = "Integration input's type"
}

variable "stage_name" {
    type = string
    description = "Name of stage"
}

variable "dynamodb_table_name" {
    type = string
    description = "Name of dynamodb table"
}

variable "hash_key" {
    type = string
    description = "Name of hash or partition key"
}

variable "billing_mode" {
    type = string
    description = "Billing mode for dynamodb table"
}

variable "stream_enabled" {
    type = bool
    description = "Whether or not to enable dynamodb event streams"
}

variable "attribute_name" {
    type = string
    description = "Name of attribute"
}

variable "attribute_key_type" {
    type = string
    description = "The data type of attribute key"
}

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

# variable "role" {
#   type = string
#   description = "IAM role for lambda function"
# }

variable "function_name_dynamdb" {
  type = string
  description = "Name of lambda function for dynamodb lambda function"
}

variable "method_type" {
  type = string
  description = "Method of archiving file"
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

variable "sqs_queue_name" {
    type = string
    description = "Name of sqs queue"
}

variable "deadletter_queue_name" {
    type = string
    description = "Name of sqs queue"
}

variable "delay_seconds" {
    type = number
    description = "Number of delayed seconds"
}

variable "max_message_size" {
    type = number
    description = "The maximum number of messages to have in a queue"
}

variable "message_retention_seconds" {
    type = number
    description = "The number of seconds to retain a message in queue"
}

variable "receive_wait_time_seconds" {
    type = number
    description = "Number of seconds to wait before application can consume messages from queue"
}

variable "max_receive_count" {
    type = number
    description = "Number of messages to replay back to source queue"
}