provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Environment = var.env
    }
  }
}

terraform {
  required_version = ">= 1.15.0"

  required_providers {
    aws = {
      version = "~> 6.55.0"
    }
  }
}