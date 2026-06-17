resource "aws_cloudwatch_event_bus" "my_event_bus" {
  name              = var.event_bus_name
  description       = var.event_bus_description
}

resource "aws_cloudwatch_event_target" "s3_lambda_event_target" {
  rule      = aws_cloudwatch_event_rule.dynamodb_write_rule.name
  arn       = var.target_arn_resource
  event_bus_name = aws_cloudwatch_event_bus.my_event_bus.name
}

resource "aws_cloudwatch_event_rule" "dynamodb_write_rule" {
  name        = var.event_bus_rule_name
  description = var.event_rule_description

  event_pattern = jsonencode({
    source = [
      var.source
    ]

    detail-type = [
      var.detail_type
    ]
  })
}

resource "aws_pipes_pipe" "dynamodb_streams_eventbride_pipe" {
  name       = var.eventbridge_pipe_name
  role_arn   = var.eventbridge_pipe_role
  source     = var.eventbridge_pipe_source
  target     = var.eventbridge_pipe_target
}