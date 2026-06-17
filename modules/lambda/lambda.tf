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
  filename      = data.archive_file.lambda_dynamodb.output_path
  function_name = var.dynamodb_lambda_function_name
  role          = var.role
  handler       = var.dynamodb_function_handler
  code_sha256   = data.archive_file.lambda_dynamodb.output_base64sha256
  runtime = var.runtime
  timeout = var.timeout
}

resource "aws_lambda_permission" "allow_apigateway" {
  statement_id  = var.apigateway_statement_id
  action        = var.apigateway_action
  function_name = aws_lambda_function.lambda_dynamodb.function_name
  principal     = var.apigateway_principle
  source_arn    = var.source_arn
}

resource "aws_lambda_function" "lambda_s3" {
  filename      = data.archive_file.lambda_s3.output_paths
  function_name = var.s3_lambda_function_name
  role          = aws_iam_role.example.arn
  handler       = var.s3_function_handler
  code_sha256   = data.archive_file.lambda_s3.output_base64sha256
  runtime = var.runtime
  timeout = var.timeout
}
