# Provider
provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Env        = "dev"
      Repository = "<repository_name>"
    }
  }
}
