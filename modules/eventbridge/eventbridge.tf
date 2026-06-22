resource "aws_cloudwatch_event_bus" "my_event_bus" {
  name              = var.event_bus_name
  description       = var.event_bus_description
}

resource "aws_cloudwatch_event_rule" "dynamodb_write_rule" {
  name        = var.event_bus_rule_name
  event_bus_name = aws_cloudwatch_event_bus.my_event_bus.name
  description = var.event_bus_rule_description

  event_pattern = jsonencode({
    source = [
      var.eventbridge_source
    ]

    detail-type = [
      var.detail_type
    ]
  })
}

resource "aws_cloudwatch_event_target" "s3_lambda_event_target" {
  rule      = aws_cloudwatch_event_rule.dynamodb_write_rule.name
  arn       = var.target_arn_resource
  event_bus_name = aws_cloudwatch_event_bus.my_event_bus.name
}

resource "aws_pipes_pipe" "dynamodb_streams_eventbride_pipe" {
  name       = var.eventbridge_pipe_name
  role_arn   = var.eventbridge_pipe_role
  source     = var.eventbridge_pipe_source
  target     = var.eventbridge_pipe_target

  source_parameters {
    dynamodb_stream_parameters {
      starting_position          = "LATEST"
      batch_size                 = 10
      maximum_batching_window_in_seconds = 5
      maximum_retry_attempts     = 3
    }

    # Only capture INSERT and MODIFY events
  filter_criteria {
    filter {
      pattern = jsonencode({
        eventName = ["INSERT", "MODIFY"]
      })
    }
  }
 }
}

