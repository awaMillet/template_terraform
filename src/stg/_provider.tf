# Provider
provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Env        = "stg"
      Repository = "<repository_name>"
    }
  }
}
