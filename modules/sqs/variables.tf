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