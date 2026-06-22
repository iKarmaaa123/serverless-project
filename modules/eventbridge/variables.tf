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

variable "detail_type" {
    type = string
    description = "What type of event has happened"
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