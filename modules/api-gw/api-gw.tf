data "aws_region" "current" {}

resource "aws_api_gateway_rest_api" "my_aws_api_gateway_rest_api" {
  name = var.api_gateway_name
}

resource "aws_api_gateway_resource" "username_aws_api_gateway_resource" {
  rest_api_id = aws_api_gateway_rest_api.my_aws_api_gateway_rest_api.id
  parent_id   = aws_api_gateway_rest_api.my_aws_api_gateway_rest_api.root_resource_id
  path_part   = var.path_part
}

resource "aws_api_gateway_method" "post_method" {
  rest_api_id   = aws_api_gateway_rest_api.my_aws_api_gateway_rest_api.id
  resource_id   = aws_api_gateway_resource.username_aws_api_gateway_resource.id
  http_method   = var.http_method
  authorization = var.authorization
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id = aws_api_gateway_rest_api.my_aws_api_gateway_rest_api.id
  resource_id = aws_api_gateway_resource.username_aws_api_gateway_resource.id
  http_method = var.http_method
  type        = var.integration_input_type
  integration_http_method = var.http_method
  uri         = var.uri
}

resource "aws_api_gateway_deployment" "restapi_deployment" {
  depends_on = [ aws_api_gateway_integration.lambda_integration ]
  rest_api_id = aws_api_gateway_rest_api.my_aws_api_gateway_rest_api.id
}

resource "aws_api_gateway_stage" "my_aws_api_gateway_rest_api" {
  deployment_id = aws_api_gateway_deployment.restapi_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.my_aws_api_gateway_rest_api.id
  stage_name    = var.stage_name
}