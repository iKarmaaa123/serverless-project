provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.15.0"

  required_providers {
    aws = {
      version = "~> 6.55.0"
    }
  }
  backend "s3" {
    bucket       = "serverless-project-tfstate"
    key          = "statefile/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}