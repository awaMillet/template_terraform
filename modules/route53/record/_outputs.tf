output "name" {
  value       = aws_route53_record.main.name
  description = "The name of the record"
}

output "fqdn" {
  value       = aws_route53_record.main.fqdn
  description = "The FQDN built using the zone domain and record name"
}

output "type" {
  value       = aws_route53_record.main.type
  description = "The record type"
}

output "records" {
  value       = aws_route53_record.main.records
  description = "The record values"
}
