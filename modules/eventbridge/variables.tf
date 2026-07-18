variable "event_bus_name" {
    type = string
    description = "Name of event bus"
}

variable "event_bus_description" {
    type = string
    description = "Description for event bus"
}

variable "event_bus_rule_description" {
    type = string
    description = "Description of rule event"
}

variable "event_bus_rule_name" {
    type = string
    description = "Name for event bus rule name"
}

variable "eventbridge_source" {
    type = string
    description = "source of where the event came from"
}

variable "eventbridge_detail_type" {
    type = string
    description = "Detail type for event bus rule and eventbridge pipe target"
}

variable "target_arn_resource" {
    type = string
    description = "Arn for target resource"  
}

variable "eventbridge_pipe_name" {
    type = string
    description = "Name of eventbridge pipe" 
}

variable "eventbridge_pipe_role" {
    type = string
    description = "Eventbridge pipe IAM role"
}

variable "eventbridge_pipe_source" {
    type = string
    description = "Source for where events are coming from"
}

variable "eventbridge_pipe_target" {
    type = string
    description = "Target for where to route events to"
}

variable "eventbridge_pipes_log_group" {
    type = string
    description = "Arn for log group"
}

variable "eventbridge_pipe_log_level" {
    type = string
    description = "Log level for eventbridge pipe"
}

variable "eventbridge_pipe_starting_position" {
    type = string
    description = "Starting position for dynamodb stream event consumption"
}

variable "eventbridge_pipe_batch_size" {
    type = number
    description = "Number of records to process per batch from dynamodb streams"
}

variable "eventbridge_pipe_maximum_batching_window_in_seconds" {
    type = number
    description = "Maximum time to buffer records before processing a batch"
}

variable "eventbridge_pipe_maximum_retry_attempts" {
    type = number
    description = "Maximum number of retry attempts for failed records"
}

variable "eventbridge_pipe_filter_event_names" {
    type = list(string)
    description = "Dynamodb stream event names to include in eventbridge pipe"
}