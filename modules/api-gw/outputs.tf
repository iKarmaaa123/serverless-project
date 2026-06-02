output "apigateway_arn" {
    value = aws_api_gateway_rest_api.my_aws_api_gateway_rest_api.arn
    description = "Arn for api gateway"
}