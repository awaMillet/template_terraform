locals {
  tmpl_dir = "../../template"
}

# Lambda IAM Role
module "lambda_iam" {
  source = "../iam"

  env_str             = var.env_str
  service_str         = var.service_str
  role_name           = "${upper(var.service_str)}-${title(var.env_str)}-Lambda-Role"
  assume_role_service = "lambda.amazonaws.com"
  managed_policy_arns = [
    data.aws_iam_policy.amazon_s3_full_access.arn,
    "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  ]
  #inline_policy_name = "${upper(var.service_str)}-${title(var.env_str)}-Lambda-Basic-Policy"
  #inline_policy = templatefile("${local.tmpl_dir}/iam-policy-lambda-logging.json", {
  #  aws_account_id = data.aws_caller_identity.current.account_id
  #})
}
