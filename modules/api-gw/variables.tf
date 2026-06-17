variable "api_gateway_name" {
    type = string
    description = "Name of api gateway"
}

variable "path_part" {
    type = string
    description = "path that api supports"
}

variable "uri" {
    type = string
    description = "uri of lambda function to trigger when api gateway receives POST request"
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