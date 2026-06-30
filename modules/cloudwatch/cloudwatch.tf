resource "aws_cloudwatch_log_group" "eventbridge_pipes_log_group" {
  name = "eventbridge-pipes-cloudwatch-logs"
}

resource "aws_cloudwatch_log_group" "eventbridge_event_bus_log_group" {
  name = "eventbridge-event-bus-cloudwatch-logs"
}

resource "aws_cloudwatch_log_delivery_source" "info_logs" {
  name         = "event-bus-source-info-logs"
  log_type     = "INFO_LOGS"
  resource_arn = var.event_bus_arn
}

resource "aws_cloudwatch_log_delivery_destination" "cwlogs" {
  name = "eventbus-delivery-destination-cloudwatch-logs"
  delivery_destination_configuration {
    destination_resource_arn = aws_cloudwatch_log_group.eventbridge_event_bus_log_group.arn
  }
}

resource "aws_cloudwatch_log_delivery" "cwlogs_info_logs" {
  delivery_destination_arn = aws_cloudwatch_log_delivery_source.info_logs.arn
  delivery_source_name     = aws_cloudwatch_log_delivery_destination.cwlogs.arn
  depends_on = [
    aws_cloudwatch_log_delivery.s3_info_logs
  ]
}

