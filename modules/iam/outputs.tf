output "lambda_dynamodb_execution_iam_role" {
  value       = aws_iam_role.lambda_dynamodb_execution_role.arn
  description = "Lambda DynamodDB function exeuction IAM role"
}

output "lambda_s3_execution_iam_role" {
  value       = aws_iam_role.lambda_s3_execution_role.arn
  description = "Lambda S3 function exeuction IAM role"
}

output "eventbridge_pipes_role_arn" {
  value       = aws_iam_role.eventbridge_pipes_role.arn
  description = "IAM role ARN for EventBridge Pipes"
}