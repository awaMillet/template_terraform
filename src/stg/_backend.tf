# Backend
terraform {
  required_version = "<terraform_version>"

  required_providers {
    aws = "<terraform_aws_provider_version>"
  }

  backend "s3" {
    bucket         = "<stg_tfbackend_name>"
    dynamodb_table = "<stg_tfbackend_name>"
    region         = "ap-northeast-1"
    key            = "terraform.tfstate"
    encrypt        = true
  }
}
