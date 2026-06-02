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