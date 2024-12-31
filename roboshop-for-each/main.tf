variable "instances" {
  default = {
    frontend = {}
    cart = {}
    catalogue = {}
    user = {}
    shipping = {}
    payment = {}
    mysql = {}
    mongodb = {}
    rabbitmq = {}
    redis = {}
  }
}

resource "aws_instance" "instance" {
  for_each = var.instances
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0049ef5ba290b1d61"]
  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "record" {
  for_each = var.instances
  zone_id = "Z06372633BKYPXSU4MUBQ"
  name    = "${each.key}-dev.tejadevopsb81.icu"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.instance.private_ip]
}