data "archive_file" "lambda_dynamodb" {
  type        = var.method_type
  source_file = "${path.module}/functions/dynamodb.py"
  output_path = "${path.module}/functions/function.zip"
}

# data "archive_file" "lambda_s3" {
#   type        = var.method_type
#   source_file = "${path.module}/functions"
#   output_path = "${path.module}/lambda_function.zip"
# }

resource "aws_lambda_function" "lambda_dynamodb" {
  filename      = data.archive_file.lambda_dynamodb.output_path
  function_name = var.function_name_dynamdb
  role          = var.role
  handler       = var.handler
  code_sha256   = data.archive_file.lambda_dynamodb.output_base64sha256
  runtime = var.runtime
}

resource "aws_lambda_permission" "allow_apigateway" {
  statement_id  = var.apigateway_statement_id
  action        = var.apigateway_action
  function_name = aws_lambda_function.lambda_dynamodb.function_name
  principal     = var.apigateway_principle
  source_arn    = var.source_arn
}

# resource "aws_lambda_function" "lambda_s3" {
#   filename      = data.archive_file.example.output_path
#   function_name = "dynamodb_lambda_function"
#   role          = aws_iam_role.example.arn
#   handler       = "index.handler"
#   code_sha256   = data.archive_file.example.output_base64sha256

#   runtime = "python3.14"
# }
