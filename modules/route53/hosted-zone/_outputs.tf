output "zone_id" {
  value       = aws_route53_zone.main.zone_id
  description = "The hosted zone ID"
}

output "zone_arn" {
  value       = aws_route53_zone.main.arn
  description = "The ARN of the hosted zone"
}

output "name_servers" {
  value       = aws_route53_zone.main.name_servers
  description = "List of name servers for the hosted zone (public zones only)"
}

output "domain_name" {
  value       = aws_route53_zone.main.name
  description = "The domain name of the hosted zone"
}

output "primary_name_server" {
  value       = aws_route53_zone.main.primary_name_server
  description = "The primary name server for the hosted zone"
}
