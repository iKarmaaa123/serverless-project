output "lambda_function_dynamodb_arn" {
    value = aws_lambda_function.lambda_dynamodb.arn
    description = "Arn for lambda function dynamodb"
}

output "lambda_function_s3_arn" {
    value = aws_lambda_function.lambda_s3.arn
    description = "Arn for lambda function s3"
}

output "lambda_function_dynamodb_invoke_arn" {
    value = aws_lambda_function.lambda_dynamodb.invoke_arn
    description = "Dynamodb lambda function invoke arn"
}