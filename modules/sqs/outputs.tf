output "deadletter_queue_arn" {
  value       = aws_sqs_queue.my_aws_sqs_deadletter_queue.arn
  description = "Output variable for dead letter queue arn"
}