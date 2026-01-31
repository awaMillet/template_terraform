resource "aws_db_subnet_group" "main" {
  name       = "${var.service_str}-${var.env_str}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.service_str}-${var.env_str}-db-subnet-group"
  }
}

output "subnet_group_name" {
  value       = aws_db_subnet_group.main.name
  description = "The name of the DB subnet group"
}
