output "certificate_arn" {
  description = "The ARN for the generated certificate so that is can be passed to other services e.g. ELBs"
  value       = aws_acm_certificate.domain_certificate.arn
}

output "zone_arn" {
  description = "The ARN for the created zone so that you can add other records to the zone"
  value       = data.aws_route53_zone.hosted_zone.arn
}

output "zone_id" {
  description = "The ID for the created zone so that you can add other records to the zone"
  value       = data.aws_route53_zone.hosted_zone.zone_id
}
