variable "env" {
  type        = string
  description = "Name of environment"
}

variable "event_bus_arn" {
  type        = string
  description = "Arn for event bus"
}

variable "dynamodb_function_name" {
  type        = string
  description = "Name of DynamoDB function"
}

variable "s3_function_name" {
  type        = string
  description = "Name of DynamoDB function"
}

variable "eventbridge_pipes_log_group_name" {
  type        = string
  description = "Name of cloudwatch log group for eventbridge pipes"
}

variable "lambda_alarm_comparison_operator" {
  type        = string
  description = "Comparison operator for lambda alarms"
}

variable "lambda_alarm_evaluation_periods" {
  type        = number
  description = "Number of evaluation periods for lambda alarms"
}

variable "lambda_alarm_namespace" {
  type        = string
  description = "Cloudwatch namespace for lambda alarm metrics"
}

variable "lambda_alarm_period" {
  type        = number
  description = "Period in seconds for lambda alarm metrics"
}

variable "lambda_error_metric_name" {
  type        = string
  description = "Metric name used for lambda error alarms"
}

variable "lambda_error_alarm_statistic" {
  type        = string
  description = "Statistic used for lambda error alarms"
}

variable "lambda_error_alarm_threshold" {
  type        = number
  description = "Threshold used for lambda error alarms"
}

variable "lambda_error_alarm_description" {
  type        = string
  description = "Description used for lambda error alarms"
}

variable "lambda_throttle_metric_name" {
  type        = string
  description = "Metric name used for lambda throttle alarms"
}

variable "lambda_throttle_alarm_statistic" {
  type        = string
  description = "Statistic used for lambda throttle alarms"
}

variable "lambda_throttle_alarm_threshold" {
  type        = number
  description = "Threshold used for lambda throttle alarms"
}

variable "lambda_throttle_alarm_description" {
  type        = string
  description = "Description used for lambda throttle alarms"
}

variable "lambda_alarm_topic_name" {
  type        = string
  description = "Base name for lambda alarm sns topic"
}

variable "protocol" {
  type        = string
  description = "Protocol for SNS topic subscription"
}

variable "endpoint" {
  type        = string
  description = "Endpoint to send sns message to"
}

