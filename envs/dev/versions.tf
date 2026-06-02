provider "aws" {
  
  access_key = "test"
  secret_key = "test"
  region = "us-east-1"
    default_tags {
      tags = {
        Environment = var.env
      }
    }
}

# terraform {
#   required_providers {tf
#     }
#   }
#   backend "s3" {
#     bucket = "mybucket"
#     key    = "path/to/my/key"
#     region = "us-east-1"
#   }
# }
