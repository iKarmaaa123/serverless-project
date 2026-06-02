module "api-gateway" {
    source = "../../modules/api-gw"
    api_gateway_name = var.api_gateway_name
    path_part = var.path_part
    uri = module.lambda.lambda_function_dynamodb_uri
    http_method = var.http_method
    authorization = var.authorization
    integration_input_type = var.integration_input_type
    stage_name = var.stage_name
}

module "iam" {
    source = "../../modules/iam"
    lambda_execution_role_name = var.lambda_execution_role_name
    lambda_logging_policy_name = var.lambda_logging_policy_name
    lambda_dynamodb_policy_name = var.lambda_dynamodb_policy_name
    lambda_function_arn = module.lambda.lambda_function_dynamodb_arn
}

module "lambda" {
    source = "../../modules/lambda"
    role = module.iam.lambda_execution_iam_role
    runtime = var.runtime
    handler = var.handler
    method_type = var.method_type
    function_name_dynamdb = var.function_name_dynamdb
    apigateway_statement_id = var.apigateway_statement_id
    apigateway_action = var.apigateway_action
    apigateway_principle = var.apigateway_principle
    source_arn = module.api-gateway.apigateway_arn
}

module "dynamodb" {
    source = "../../modules/dynamodb"
    dynamodb_table_name = var.dynamodb_table_name
    billing_mode = var.billing_mode
    hash_key = var.hash_key
    stream_enabled = var.stream_enabled
    attribute_key_type = var.attribute_key_type
    attribute_name = var.attribute_name
}

module "sqs" {
    source = "../../modules/sqs"
    sqs_queue_name =var.sqs_queue_name
    max_receive_count = var.max_receive_count
    receive_wait_time_seconds = var.receive_wait_time_seconds
    max_message_size = var.max_message_size
    deadletter_queue_name = var.deadletter_queue_name
    message_retention_seconds = var.message_retention_seconds
    delay_seconds = var.delay_seconds
}