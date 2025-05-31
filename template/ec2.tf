# Import Example

import {
  to = aws_instance.NAME
  id = "i-xxxxxxxxxxxxxxxx"
}

aws_instance" "NAME" {
  instance_type        = "t3.micro"
  ami                  = "ami-xxxxxxxxxxxxxx"
  iam_instance_profile = aws_iam_role.INSTANCEPROFILE.id

  tags = {
    Name      = "SAMPLE"
  }
}
