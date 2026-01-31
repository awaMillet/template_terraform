locals {
  tmpl_dir = "../../template"
}

# IAM Role
resource "aws_iam_role" "role" {
  name = var.role_name
  assume_role_policy = templatefile("${local.tmpl_dir}/iam-policy-trust-rel.json", {
    service = var.assume_role_service
  })
}

# Managed Policy Attachments
resource "aws_iam_role_policy_attachments_exclusive" "policy_attachments" {
  count       = length(var.managed_policy_arns) > 0 ? 1 : 0
  role_name   = aws_iam_role.role.name
  policy_arns = var.managed_policy_arns
}

# Inline Policies
resource "aws_iam_role_policies_exclusive" "inline_policies" {
  count        = var.inline_policy != "" ? 1 : 0
  role_name    = aws_iam_role.role.name
  policy_names = [aws_iam_role_policy.policy[0].name]
}

# Inline Policy
resource "aws_iam_role_policy" "policy" {
  count  = var.inline_policy != "" ? 1 : 0
  name   = var.inline_policy_name
  role   = aws_iam_role.role.name
  policy = var.inline_policy
}
