provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      version = "~> 5.52.0"
    }
  }
  backend "s3" {
    bucket = "serverless-project-statefile"
    key    = "statefile/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}