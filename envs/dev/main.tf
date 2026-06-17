module "api-gateway" {
    source = "../../modules/api-gw"
    api_gateway_name = var.api_gateway_name
    path_part = var.path_part
    uri = module.lambda.lambda_function_dynamodb_invoke_arn
    http_method = var.http_method
    authorization = var.authorization
    integration_input_type = var.integration_input_type
    stage_name = var.stage_name
    depends_on = [module.lambda, module.dynamodb]
}

module "iam" {
    source = "../../modules/iam"
    lambda_dynamodb_role_name = var.lambda_dynamodb_role_name
    lambda_s3_role_name = var.lambda_s3_role_name
    dynamodb_policy_name = var.dynamodb_policy_name
    logging_policy_name = var.logging_policy_name
    s3_policy_name = var.s3_policy_name
    eventbridge_policy_name = var.eventbridge_policy_name
    dynamodb_table_arn = module.dynamodb.dynamodb_table_arn
    s3_bucket_arn = module.s3.s3_bucket_arn
    eventbus_arn = module.eventbridge.eventbridge_arn
    cloudwatch_log_group_arn = var.cloudwatch_log_group_arn
    dynamodb_streams_policy_name = var.dynamodb_streams_policy_name
}

module "lambda" {
    source = "../../modules/lambda"
    role = module.iam.lambda_execution_iam_role
    runtime = var.runtime
    dynamodb_function_handler = var.dynamodb_function_handler
    s3_function_handler = var.s3_function_handler
    method_type = var.method_type
    dynamodb_lambda_function_name = var.dynamodb_lambda_function_name
    s3_lambda_function_name = var.s3_lambda_function_name
    apigateway_statement_id = var.apigateway_statement_id
    apigateway_action = var.apigateway_action
    apigateway_principle = var.apigateway_principle
    source_arn = module.api-gateway.apigateway_arn
    timeout = var.timeout
    depends_on = [module.iam]
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
    receive_wait_time_seconds = var.receive_wait_time_seconds
    max_message_size = var.max_message_size
    deadletter_queue_name = var.deadletter_queue_name
    message_retention_seconds = var.message_retention_seconds
    delay_seconds = var.delay_seconds
    depends_on = [module.lambda]
}

module "eventbridge" {
    source = "../../modules/eventbridge"
    event_bus_name = var.event_bus_name
    event_bus_description = var.event_bus_description
    event_bus_rule_name =  var.event_rule_name
    event_rule_name = var.event_rule_name
    event_rule_description = var.event_rule_description
    detail_type = var.detail_type
    target_arn_resource = module.lambda.lambda_function_s3_arn
    depends_on = [module.dynamodb, module.lambda]
    eventbridge_pipe_name = var.eventbridge_pipe_name
    eventbridge_pipe_role = module.iam.eventbridge_pipes_role_arn
    eventbridge_pipe_source = module.dynamodb.dynamodb_stream_arn
    eventbridge_pipe_target = module.eventbridge.eventbridge_arn
}

module "s3" {
    source = "../../modules/s3"
    bucket_name = var.bucket_name
}