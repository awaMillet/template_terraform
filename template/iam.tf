# iamを例にしてfile関数やtemplatefile関数の例を記述

resource "aws_iam_role" "pipeline" {
  name = "PipeLine"
  # templatefile(path, vars)
  # https://developer.hashicorp.com/terraform/language/functions/templatefile
  assume_role_policy = templatefile("./iam-policy-trust-rel.json", {
    service = "codepipeline.amazonaws.com"
  })
}

resource "aws_iam_role_policy" "pipeline" {
  name = "pipeline-policy"
  role = aws_iam_role.pipeline.id
  # file(path)
  # https://developer.hashicorp.com/terraform/language/functions/file
  policy = file("./iam-policy-codepipeline.json")
}
