output "apigateway_execution_arn" {
    value = aws_api_gateway_rest_api.my_aws_api_gateway_rest_api.execution_arn
    description = "Arn for api gateway"
}