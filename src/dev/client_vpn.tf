###########
# VPN構築 #
###########
# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "vpn_log_group" {
  name              = "/aws/clientVPN/${local.service}-${local.env}"
  retention_in_days = 365

  tags = {
    Name = "${local.service}-${local.env}"
  }
}

# CloudWatch Log Stream
resource "aws_cloudwatch_log_stream" "vpn_log_stream" {
  name           = "connection-vpn-log"
  log_group_name = aws_cloudwatch_log_group.vpn_log_group.name
}

# Client VPN Endpoint
resource "aws_ec2_client_vpn_endpoint" "test" {
  description            = "terraform-clientvpn-${local.env}-test"
  server_certificate_arn = "arn:aws:acm:ap-northeast-1:${data.aws_caller_identity.current.account_id}:certificate/XXXXXXXX"
  client_cidr_block      = "99.0.0.0/16"

  self_service_portal   = "disabled"
  split_tunnel          = true
  session_timeout_hours = 8

  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = "arn:aws:acm:ap-northeast-1:${data.aws_caller_identity.current.account_id}:certificate/XXXXXXXX"
  }

  connection_log_options {
    enabled               = true
    cloudwatch_log_group  = aws_cloudwatch_log_group.vpn_log_group.name
    cloudwatch_log_stream = aws_cloudwatch_log_stream.vpn_log_stream.name
  }

  tags = {
    Name = "${local.service}-${local.env}-vpn"
  }
}

# Client VPN Network Association (冗長性不要のため1AZのみ)
resource "aws_ec2_client_vpn_network_association" "private_a" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.test.id
  subnet_id              = module.network.private_a_id
}

# Client VPN Authorization Rule (VPC CIDR全体へのアクセスを許可)
resource "aws_ec2_client_vpn_authorization_rule" "vpc" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.test.id
  target_network_cidr    = module.network.vpc_cidr_block
  authorize_all_groups   = true
}

# VPC Endpoint for execute-api (Mock API Gateway PRIVATE用)
## VPCエンドポイント用セキュリティグループ
module "vpce_security_group" {
  source = "../../modules/security-group"

  vpc_id      = module.network.vpc_id
  name        = "${local.service}-${local.env}-vpce-execute-api-sg"
  description = "for ${local.service} execute-api VPC Endpoint in ${local.env} environment"
  ingress_rules = [
    {
      description = "Allow HTTPS from VPC"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = [module.network.vpc_cidr_block]
    }
  ]
}

## VPCエンドポイント
resource "aws_vpc_endpoint" "execute_api" {
  vpc_id              = module.network.vpc_id
  service_name        = "com.amazonaws.ap-northeast-1.execute-api"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids = [
    module.network.private_a_id,
  ]

  security_group_ids = [
    module.vpce_security_group.security_group_id,
  ]

  tags = {
    Name = "${local.service}-${local.env}-vpce-execute-api"
  }
}

# SSM Parameter for VPC Endpoint ID
resource "aws_ssm_parameter" "vpce_api" {
  name  = "${local.service}-${local.env}-vpce-api"
  type  = "String"
  value = aws_vpc_endpoint.execute_api.id

  tags = {
    Name = "${local.service}-${local.env}"
  }
}
