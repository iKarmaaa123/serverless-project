output "dynamodb_table_arn" {
  value       = aws_dynamodb_table.my_aws_dynamodb_table.arn
  description = "Arn for dynamodb table"
}

output "dynamodb_stream_arn" {
  value       = aws_dynamodb_table.my_aws_dynamodb_table.stream_arn
  description = "Arn for dynamodb stream"
}