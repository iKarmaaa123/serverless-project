resource "aws_cloudwatch_event_bus" "my_event_bus" {
  name        = var.event_bus_name
  description = var.event_bus_description
}

resource "aws_cloudwatch_event_rule" "dynamodb_write_rule" {
  name           = var.event_bus_rule_name
  event_bus_name = aws_cloudwatch_event_bus.my_event_bus.name
  description    = var.event_bus_rule_description

  event_pattern = jsonencode({
    source      = [var.eventbridge_source]
    detail-type = [var.eventbridge_detail_type]
  })
}

resource "aws_cloudwatch_event_target" "s3_lambda_event_target" {
  rule           = aws_cloudwatch_event_rule.dynamodb_write_rule.name
  arn            = var.target_arn_resource
  event_bus_name = aws_cloudwatch_event_bus.my_event_bus.name
}

resource "aws_pipes_pipe" "dynamodb_streams_eventbride_pipe" {
  name     = var.eventbridge_pipe_name
  role_arn = var.eventbridge_pipe_role
  source   = var.eventbridge_pipe_source
  target   = var.eventbridge_pipe_target

  log_configuration {
    level = var.eventbridge_pipe_log_level

    cloudwatch_logs_log_destination {
      log_group_arn = var.eventbridge_pipes_log_group
    }
  }

  source_parameters {
    dynamodb_stream_parameters {
      starting_position                  = var.eventbridge_pipe_starting_position
      batch_size                         = var.eventbridge_pipe_batch_size
      maximum_batching_window_in_seconds = var.eventbridge_pipe_maximum_batching_window_in_seconds
      maximum_retry_attempts             = var.eventbridge_pipe_maximum_retry_attempts
    }

    filter_criteria {
      filter {
        pattern = jsonencode({
          eventName = var.eventbridge_pipe_filter_event_names
        })
      }
    }
  }

  target_parameters {
    eventbridge_event_bus_parameters {
      source      = var.eventbridge_source
      detail_type = var.eventbridge_detail_type
    }
  }
}