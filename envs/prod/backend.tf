terraform {
  backend "s3" {
    bucket       = "serverless-project-tfstate"
    key          = "statefile/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}