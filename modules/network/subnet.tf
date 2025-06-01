# public subnet
resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_a_cidr_block
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_a"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_c_cidr_block
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_c"
  }
}

resource "aws_subnet" "public_d" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_d_cidr_block
  availability_zone       = "ap-northeast-1d"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_d"
  }
}

# private subnet
resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_a_cidr_block
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "private_a"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_c_cidr_block
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "private_c"
  }
}

resource "aws_subnet" "private_d" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_d_cidr_block
  availability_zone = "ap-northeast-1d"

  tags = {
    Name = "private_d"
  }
}

output public_a_id {
  value       = aws_subnet.public_a.id
}

output public_c_id {
  value       = aws_subnet.public_c.id
}

output public_d_id {
  value       = aws_subnet.public_d.id
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
