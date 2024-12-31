variable "instances" {
  default = ["test1", "test2"]
}

module "ec2" {
  count = length(var.instances)
  source = "./ec2"
  instance_name = var.instances[count.index]
}

variable "instance_name" {}