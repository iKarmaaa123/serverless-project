output "lambda_execution_iam_role" {
    value = aws_iam_role.lambda_execution_role.arn
    description = "Lambda exeuction IAM role"
}