resource "aws_instance" "ec2" {
  instance_type                        = var.target_instance_type
  ami                                  = var.target_ami
  subnet_id                            = var.target_subnet
  availability_zone                    = var.target_az
  iam_instance_profile                 = aws_iam_instance_profile.ec2.id
  key_name                             = ""
  hibernation                          = false
  instance_initiated_shutdown_behavior = "stop"
  vpc_security_group_ids               = [aws_security_group.ec2.id]

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 100
    iops                  = 3000
    delete_on_termination = true
    encrypted             = false

    tags = {
      Name = var.tag_name
    }
  }

  user_data = var.user_data != null ? var.user_data : null

  tags = {
    Name = var.tag_name
  }
}
