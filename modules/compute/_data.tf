data "aws_iam_policy" "amazon_s3_full_access" {
  name = "AmazonS3FullAccess"
}

data "aws_iam_policy" "cloudwatch_agent_server_policy" {
  name = "CloudWatchAgentServerPolicy"
}
