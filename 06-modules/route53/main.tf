resource "aws_route53_record" "record" {
  zone_id = "Z06372633BKYPXSU4MUBQ"
  name    = "${var.instance_name}-dev.tejadevopsb81.icu"
  type    = "A"
  ttl     = "30"
  records = [var.ip_address]
}

variable "instance_name" {}
variable "ip_address" {}