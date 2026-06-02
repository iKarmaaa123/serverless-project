output "lambda_function_dynamodb_arn" {
    value = aws_lambda_function.lambda_dynamodb.arn
    description = "Arn for lambda function dynamodb"
}

output "lambda_function_dynamodb_uri" {
    value = aws_lambda_function.lambda_dynamodb.invoke_arn
    description = "Dynamodb lambda function invoke arn"
}