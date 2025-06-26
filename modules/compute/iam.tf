locals {
  tmpl_dir = "../../template"
}

resource "aws_iam_instance_profile" "ec2" {
  name = "${upper(var.service_str)}-${title(var.env_str)}-InstanceProfileRole"
  role = aws_iam_role.ec2.name
}

resource "aws_iam_role" "ec2" {
  name = "${upper(var.service_str)}-${title(var.env_str)}-EC2-Role"
  assume_role_policy = templatefile("${local.tmpl_dir}/iam-policy-trust-rel.json", {
    service = "ec2.amazonaws.com"
  })
}

resource "aws_iam_role_policy_attachments_exclusive" "ec2_managed_policy" {
  role_name = aws_iam_role.ec2.name
  policy_arns = [
    data.aws_iam_policy.amazon_s3_full_access.arn,
    data.aws_iam_policy.cloudwatch_agent_server_policy.arn
  ]
}
