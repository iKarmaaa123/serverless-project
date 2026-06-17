output "lambda_execution_iam_role" {
    value = aws_iam_role.lambda_execution_role.arn
    description = "Lambda exeuction IAM role"
}

output "eventbridge_pipes_role_arn" {
    value       = aws_iam_role.eventbridge_pipes_role.arn
    description = "IAM role ARN for EventBridge Pipes"
}