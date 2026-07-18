output "event_bus_arn" {
  value       = aws_cloudwatch_event_bus.my_event_bus.arn
  description = "ARN for event bus"
}

output "event_bus_rule_arn" {
  value       = aws_cloudwatch_event_rule.dynamodb_write_rule.arn
  description = "Arn for event bus rule"
}