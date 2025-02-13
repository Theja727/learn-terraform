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
  ami           = "ami-01d9831eed425ebf1"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-06d14fa6f7ba410a1"]
  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "record" {
  for_each = var.instances
  zone_id = "Z10165773L4FEVYHDJOSY"
  name    = "${each.key}-dev.tejadevopsb81.icu"
  type    = "A"
  ttl     = "30"
  records = [aws_instance.instance[each.key].private_ip]
}