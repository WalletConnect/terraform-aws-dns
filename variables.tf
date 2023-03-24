variable "hosted_zone_name" {
  description = <<-EOF
    The domain for the zone, e.g. `login.walletconnect.com`, this will result in the certificate of `*.login.walletconnect.com`"
    The `hosted_zone_name` has to be created externally and can be a public or private hosted zone.
EOF
  type        = string
}

variable "fqdn" {
  description = "The FQDN of the record"
  type        = string
}
