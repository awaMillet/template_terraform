data "aws_caller_identity" "current" {}

data "aws_iam_policy" "amazon_s3_full_access" {
  name = "AmazonS3FullAccess"
}

data "archive_file" "dummy_lambda" {
  type        = "zip"
  output_path = "${path.module}/files/dummy.zip"

  source {
    content  = "dummy"
    filename = "dummy.txt"
  }
}
