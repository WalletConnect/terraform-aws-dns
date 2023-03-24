data "aws_route53_zone" "hosted_zone" {
  name = var.hosted_zone_name
}

locals {
  verification_records = [for record in aws_acm_certificate.domain_certificate.domain_validation_options : record]
}

resource "aws_acm_certificate" "domain_certificate" {
  domain_name       = var.fqdn != null ? var.fqdn : var.hosted_zone_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = local.tags
}

resource "aws_route53_record" "cert_verification" {
  count = length(local.verification_records)

  depends_on = [
    aws_acm_certificate.domain_certificate,
  ]

  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = local.verification_records[count.index].resource_record_name
  type    = local.verification_records[count.index].resource_record_type
  records = [local.verification_records[count.index].resource_record_value]
  ttl     = 300

  allow_overwrite = true
}
