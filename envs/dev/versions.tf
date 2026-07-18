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
