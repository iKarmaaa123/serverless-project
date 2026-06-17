resource "aws_sqs_queue" "my_aws_sqs_deadletter_queue" {
  name                      = var.deadletter_queue_name
  delay_seconds             = var.delay_seconds
  max_message_size          = var.max_message_size
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds
}