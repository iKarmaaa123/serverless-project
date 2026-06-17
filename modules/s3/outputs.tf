output "s3_bucket_arn" {
    value = aws_s3_bucket.my_aws_s3_bucket.arn
    description = "ARN for S3 bucket"
}