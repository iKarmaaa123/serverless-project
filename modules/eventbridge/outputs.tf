output "eventbridge_arn" {
  value = aws_cloudwatch_event_bus.my_event_bus.arn
  description = "ARN for event bus"
}