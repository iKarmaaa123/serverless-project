resource "aws_s3_bucket" "my_aws_s3_bucket" {
  bucket        = var.bucket_name
  force_destroy = true
}