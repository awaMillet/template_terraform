resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_a_cidr_block
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "private_a"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_c_cidr_block
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "private_c"
  }
}

resource "aws_subnet" "private_d" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_d_cidr_block
  availability_zone = "ap-northeast-1d"

  tags = {
    Name = "private_d"
  }
}

output private_a_id {
  value       = aws_subnet.private_a.id
}

output private_c_id {
  value       = aws_subnet.private_c.id
}

output private_d_id {
  value       = aws_subnet.private_d.id
}
