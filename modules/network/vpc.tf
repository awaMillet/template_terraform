resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env_str}-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.env_str}"
  }

  depends_on = [aws_internet_gateway.main]
}

output "vpc_id" {
  value = aws_vpc.main.id
}
