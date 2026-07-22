resource "aws_iam_role" "lambda_dynamodb_execution_role" {
  name = var.lambda_dynamodb_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role" "lambda_s3_execution_role" {
  name = var.lambda_s3_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role" "eventbridge_pipes_role" {
  name = "eventbridge-pipes-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "logging_policy" {
  name = var.logging_policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = [
          var.eventbridge_pipes_cloudwatch_log_group_arn,
          "arn:aws:logs:*:*:*"
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "dynamodb_policy" {
  name = var.dynamodb_policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem"
        ]
        Resource = [var.dynamodb_table_arn]
      }
    ]
  })
}

resource "aws_iam_policy" "dynamodb_streams_policy" {
  name = var.dynamodb_streams_policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:DescribeStream",
          "dynamodb:GetRecords",
          "dynamodb:GetShardIterator",
          "dynamodb:ListStreams"
        ]
        Resource = [var.dynamodb_table_stream_arn]
      }
    ]
  })
}

resource "aws_iam_policy" "s3_policy" {
  name = var.s3_policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]
        Resource = ["${var.s3_bucket_arn}/*"]
      }
    ]
  })
}

resource "aws_iam_policy" "eventbridge_policy" {
  name = var.eventbridge_policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "events:PutEvents"
        ]
        Resource = [var.event_bus_arn]
      }
    ]
  })
}

resource "aws_iam_policy" "sqs_policy" {
  name = var.sqs_policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sqs:SendMessage"
        ]
        Resource = [
          var.s3_lambda_deadletter_queue_arn
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "logging_policy_attchment_for_dynamodb_lambda_role" {
  role       = aws_iam_role.lambda_dynamodb_execution_role.name
  policy_arn = aws_iam_policy.logging_policy.arn
}

resource "aws_iam_role_policy_attachment" "logging_policy_attchment_for_s3_lambda_role" {
  role       = aws_iam_role.lambda_s3_execution_role.name
  policy_arn = aws_iam_policy.logging_policy.arn
}

resource "aws_iam_role_policy_attachment" "dynamodb_policy_attachment" {
  role       = aws_iam_role.lambda_dynamodb_execution_role.name
  policy_arn = aws_iam_policy.dynamodb_policy.arn
}

resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
  role       = aws_iam_role.lambda_s3_execution_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_role_policy_attachment" "sqs_policy_attachment_s3_lambda" {
  role       = aws_iam_role.lambda_s3_execution_role.name
  policy_arn = aws_iam_policy.sqs_policy.arn
}

resource "aws_iam_role_policy_attachment" "dynamodb_streams_policy_attachment" {
  role       = aws_iam_role.eventbridge_pipes_role.name
  policy_arn = aws_iam_policy.dynamodb_streams_policy.arn
}

resource "aws_iam_role_policy_attachment" "eventbridge_policy_attachment" {
  role       = aws_iam_role.eventbridge_pipes_role.name
  policy_arn = aws_iam_policy.eventbridge_policy.arn
}