# These resources are created only when enable_nat_gateway is true

# ------ single ------
# Elastic IP for NAT Gateway
resource "aws_eip" "nat_single" {
  count  = var.enable_nat_gateway && var.single_nat_gateway ? 1 : 0
  domain = "vpc"

  tags = {
    Name = "${var.service_name}-${var.env_str}-nat-eip"
  }

  depends_on = [aws_internet_gateway.main]
}

# NAT Gateway (placed in public_a)
resource "aws_nat_gateway" "single" {
  count         = var.enable_nat_gateway && var.single_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat_single[0].id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "${var.service_name}-${var.env_str}-nat-gateway"
  }

  depends_on = [aws_internet_gateway.main]
}

# Private Route Tables with NAT Gateway routes
resource "aws_route_table" "private_with_nat_single" {
  count  = var.enable_nat_gateway && var.single_nat_gateway ? 1 : 0
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.single[0].id
  }

  tags = {
    Name = "${var.service_name}-${var.env_str}-private-route-table"
  }
}

# Route Table Associations for Private Subnets
resource "aws_route_table_association" "private_a_single" {
  count          = var.enable_nat_gateway && var.single_nat_gateway ? 1 : 0
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_with_nat_single[0].id
}

resource "aws_route_table_association" "private_c_single" {
  count          = var.enable_nat_gateway && var.single_nat_gateway ? 1 : 0
  subnet_id      = aws_subnet.private_c.id
  route_table_id = aws_route_table.private_with_nat_single[0].id
}

resource "aws_route_table_association" "private_d_single" {
  count          = var.enable_nat_gateway && var.single_nat_gateway ? 1 : 0
  subnet_id      = aws_subnet.private_d.id
  route_table_id = aws_route_table.private_with_nat_single[0].id
}

# ------ multi-AZ ------
# Elastic IPs for NAT Gateway
resource "aws_eip" "nat_a" {
  count  = var.enable_nat_gateway && !var.single_nat_gateway ? 1 : 0
  domain = "vpc"

  tags = {
    Name = "${var.service_name}-${var.env_str}-nat-eip-a"
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_eip" "nat_c" {
  count  = var.enable_nat_gateway && !var.single_nat_gateway ? 1 : 0
  domain = "vpc"

  tags = {
    Name = "${var.service_name}-${var.env_str}-nat-eip-c"
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_eip" "nat_d" {
  count  = var.enable_nat_gateway && !var.single_nat_gateway ? 1 : 0
  domain = "vpc"

  tags = {
    Name = "${var.service_name}-${var.env_str}-nat-eip-d"
  }

  depends_on = [aws_internet_gateway.main]
}

# NAT Gateways
resource "aws_nat_gateway" "multi_a" {
  count         = var.enable_nat_gateway && !var.single_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat_a[0].id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "${var.service_name}-${var.env_str}-nat-gateway-a"
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "multi_c" {
  count         = var.enable_nat_gateway && !var.single_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat_c[0].id
  subnet_id     = aws_subnet.public_c.id

  tags = {
    Name = "${var.service_name}-${var.env_str}-nat-gateway-c"
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "multi_d" {
  count         = var.enable_nat_gateway && !var.single_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat_d[0].id
  subnet_id     = aws_subnet.public_d.id

  tags = {
    Name = "${var.service_name}-${var.env_str}-nat-gateway-d"
  }

  depends_on = [aws_internet_gateway.main]
}

# Private Route Tables with NAT Gateway routes
resource "aws_route_table" "private_with_nat_a" {
  count  = var.enable_nat_gateway && !var.single_nat_gateway ? 1 : 0
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.multi_a[0].id
  }

  tags = {
    Name = "${var.service_name}-${var.env_str}-private-route-table-a"
  }
}

resource "aws_route_table" "private_with_nat_c" {
  count  = var.enable_nat_gateway && !var.single_nat_gateway ? 1 : 0
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.multi_c[0].id
  }

  tags = {
    Name = "${var.service_name}-${var.env_str}-private-route-table-c"
  }
}

resource "aws_route_table" "private_with_nat_d" {
  count  = var.enable_nat_gateway && !var.single_nat_gateway ? 1 : 0
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.multi_d[0].id
  }

  tags = {
    Name = "${var.service_name}-${var.env_str}-private-route-table-d"
  }
}

# Route Table Associations for Private Subnets
resource "aws_route_table_association" "private_a_multi" {
  count          = var.enable_nat_gateway && !var.single_nat_gateway ? 1 : 0
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private_with_nat_a[0].id
}

resource "aws_route_table_association" "private_c_multi" {
  count          = var.enable_nat_gateway && !var.single_nat_gateway ? 1 : 0
  subnet_id      = aws_subnet.private_c.id
  route_table_id = aws_route_table.private_with_nat_c[0].id
}

resource "aws_route_table_association" "private_d_multi" {
  count          = var.enable_nat_gateway && !var.single_nat_gateway ? 1 : 0
  subnet_id      = aws_subnet.private_d.id
  route_table_id = aws_route_table.private_with_nat_d[0].id
}

# NAT Gateway Outputs
output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  value = var.enable_nat_gateway ? (
    var.single_nat_gateway
    ? [aws_nat_gateway.single[0].id]
    : [
      aws_nat_gateway.multi_a[0].id,
      aws_nat_gateway.multi_c[0].id,
      aws_nat_gateway.multi_d[0].id
    ]
  ) : []
}

output "nat_gateway_public_ips" {
  description = "List of public Elastic IPs created for NAT Gateway"
  value = var.enable_nat_gateway ? (
    var.single_nat_gateway
    ? [aws_eip.nat_single[0].public_ip]
    : [
      aws_eip.nat_a[0].public_ip,
      aws_eip.nat_c[0].public_ip,
      aws_eip.nat_d[0].public_ip
    ]
  ) : []
}
