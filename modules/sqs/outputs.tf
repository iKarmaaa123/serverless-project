output "s3_lambda_deadletter_queue_arn" {
  value       = aws_sqs_queue.s3_lambda_deadletter_queue.arn
  description = "Dead letter queue arn for s3 lambda"
}