output "eventbridge_pipes_cloudwatch_log_group_arn" {
    value = aws_cloudwatch_log_group.eventbridge_pipes_log_group.arn
}

output "eventbridge_event_bus_cloudwatch_log_group_arn" {
    value = aws_cloudwatch_log_group.eventbridge_event_bus_log_group.arn
}