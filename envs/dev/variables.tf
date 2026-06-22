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

variable logging_policy_name {
  type        = string
  description = "Policy name for logging iam policy"
}

variable dynamodb_policy_name {
  type        = string
  description = "Policy name for dynamodb iam policy"
}

variable "dynamodb_streams_policy_name" {
  type        = string
  description = "Name for DynamoDB streams IAM policy"
}

variable s3_policy_name {
  type        = string
  description = "Policy name for S3 iam policy"
}

variable "eventbridge_policy_name" {
  type        = string
  description = "Policy name for eventbridge IAM policy for lambda execution role"
}

variable "lambda_dynamodb_role_name" {
  type = string
  description = "Name for lambda dynamodb function role name"
}

variable "lambda_s3_role_name" {
  type = string
  description = "Name for lambda s3 function role name"
}

variable "cloudwatch_log_group_arn" {
  type = string
  description = "Arn for CloudWatch log group"
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
  description = "Method of archiving file"
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
  description = "What action the resource can perform over the lambda function"
}

variable "apigateway_principle" {
  type = string
  description = "AWS service that is going to invoke lambda function"
}

variable "eventbridge_principle" {
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

variable "event_bus_name" {
    type = string
    description = "Name of event bus"
}

variable "event_bus_description" {
    type = string
    description = "Description for event bus"
}

variable "event_bus_rule_name" {
    type = string
    description = "Name for event bus rule name"
}

variable "event_bus_rule_description" {
    type = string
    description = "Description of rule event"
}

variable "eventbridge_source" {
    type = string
    description = "source of where the event came from"
}

variable "detail_type" {
    type = string
    description = "What type of event has happened"
}

variable "eventbridge_pipe_name" {
    type = string
    description = "Name of eventbridge pipe" 
}

variable "bucket_name" {
    type = string
    description = "Name of S3 bucket"
}