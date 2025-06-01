resource "aws_instance" "NAME" {
  instance_type = var.target_instance_type
  ami           = var.target_ami
  subnet_id     = var.target_subnet
  # iam_instance_profile = aws_iam_role.INSTANCEPROFILE.id

  tags = {
    Name = var.tag_name
  }
}
