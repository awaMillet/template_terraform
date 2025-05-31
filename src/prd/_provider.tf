# Provider
provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Env        = "prd"
      Repository = "<repository_name>"
    }
  }
}
