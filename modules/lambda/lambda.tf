data "archive_file" "lambda_dynamodb" {
  type        = var.method_type
  source_file = "${path.module}/functions/dynamodb.py"
  output_path = "${path.module}/archive-files/dynamodb_function.zip"
}

data "archive_file" "lambda_s3" {
  type        = var.method_type
  source_file = "${path.module}/functions/s3.py"
  output_path = "${path.module}/archive-files/s3_function.zip"
}

resource "aws_lambda_function" "lambda_dynamodb" {
  filename         = data.archive_file.lambda_dynamodb.output_path
  function_name    = var.dynamodb_lambda_function_name
  source_code_hash = data.archive_file.lambda_dynamodb.output_base64sha256
  role             = var.lambda_dynamodb_function_role
  handler          = var.dynamodb_function_handler
  runtime          = var.runtime
  timeout          = var.timeout
  dead_letter_config {
    target_arn = var.dynamodb_lambda_dead_letter_queue
  }
}

resource "aws_lambda_function" "lambda_s3" {
  filename         = data.archive_file.lambda_s3.output_path
  function_name    = var.s3_lambda_function_name
  source_code_hash = data.archive_file.lambda_s3.output_base64sha256
  role             = var.lambda_s3_function_role
  handler          = var.s3_function_handler
  runtime          = var.runtime
  timeout          = var.timeout
  dead_letter_config {
    target_arn = var.s3_lambda_dead_letter_queue
  }
}

resource "aws_lambda_permission" "allow_apigateway" {
  statement_id  = var.apigateway_statement_id
  action        = var.invoke_action
  function_name = aws_lambda_function.lambda_dynamodb.function_name
  principal     = var.apigateway_principle
  source_arn    = "${var.api_gateway_source_arn}/prod/*"
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = var.eventbridge_statement_id
  action        = var.invoke_action
  function_name = aws_lambda_function.lambda_s3.function_name
  principal     = var.eventbridge_principle
  source_arn    = var.event_bus_rule_source_arn
}