resource "aws_cloudwatch_log_group" "eventbridge_pipes_log_group" {
  name = var.eventbridge_pipes_log_group_name
}

resource "aws_cloudwatch_metric_alarm" "dynamodb_lambda_errors" {
  count               = var.env == "prod" ? 1 : 0
  alarm_name          = "lambda-errors-${var.dynamodb_function_name}"
  alarm_description   = var.lambda_error_alarm_description
  comparison_operator = var.lambda_alarm_comparison_operator
  evaluation_periods  = var.lambda_alarm_evaluation_periods
  metric_name         = var.lambda_error_metric_name
  namespace           = var.lambda_alarm_namespace
  period              = var.lambda_alarm_period
  statistic           = var.lambda_error_alarm_statistic
  threshold           = var.lambda_error_alarm_threshold
  alarm_actions       = [aws_sns_topic.lambda_alarms[count.index].arn]

  dimensions = {
    FunctionName = var.dynamodb_function_name
  }
}

resource "aws_cloudwatch_metric_alarm" "dynamodb_lambda_throttles" {
  count               = var.env == "prod" ? 1 : 0
  alarm_name          = "lambda-throttles-${var.dynamodb_function_name}"
  comparison_operator = var.lambda_alarm_comparison_operator
  evaluation_periods  = var.lambda_alarm_evaluation_periods
  metric_name         = var.lambda_throttle_metric_name
  namespace           = var.lambda_alarm_namespace
  period              = var.lambda_alarm_period
  statistic           = var.lambda_throttle_alarm_statistic
  threshold           = var.lambda_throttle_alarm_threshold
  alarm_description   = var.lambda_throttle_alarm_description
  alarm_actions       = [aws_sns_topic.lambda_alarms[count.index].arn]

  dimensions = {
    FunctionName = var.dynamodb_function_name
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_lambda_errors" {
  count               = var.env == "prod" ? 1 : 0
  alarm_name          = "lambda-errors-${var.s3_function_name}"
  alarm_description   = var.lambda_error_alarm_description
  comparison_operator = var.lambda_alarm_comparison_operator
  evaluation_periods  = var.lambda_alarm_evaluation_periods
  metric_name         = var.lambda_error_metric_name
  namespace           = var.lambda_alarm_namespace
  period              = var.lambda_alarm_period
  statistic           = var.lambda_error_alarm_statistic
  threshold           = var.lambda_error_alarm_threshold
  alarm_actions       = [aws_sns_topic.lambda_alarms[count.index].arn]

  dimensions = {
    FunctionName = var.dynamodb_function_name
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_lambda_throttles" {
  count               = var.env == "prod" ? 1 : 0
  alarm_name          = "lambda-throttles-${var.s3_function_name}"
  comparison_operator = var.lambda_alarm_comparison_operator
  evaluation_periods  = var.lambda_alarm_evaluation_periods
  metric_name         = var.lambda_throttle_metric_name
  namespace           = var.lambda_alarm_namespace
  period              = var.lambda_alarm_period
  statistic           = var.lambda_throttle_alarm_statistic
  threshold           = var.lambda_throttle_alarm_threshold
  alarm_description   = var.lambda_throttle_alarm_description
  alarm_actions       = [aws_sns_topic.lambda_alarms[count.index].arn]

  dimensions = {
    FunctionName = var.s3_function_name
  }
}

resource "aws_sns_topic" "lambda_alarms" {
  count = var.env == "prod" ? 1 : 0
  name  = var.lambda_alarm_topic_name
}

resource "aws_sns_topic_subscription" "email" {
  count     = var.env == "prod" ? 1 : 0
  topic_arn = aws_sns_topic.lambda_alarms[count.index].arn
  protocol  = var.protocol
  endpoint  = var.endpoint
}