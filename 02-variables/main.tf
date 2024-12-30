variable "URL" {
  default = "var.example.com"
}

output "URL" {
  value = var.URL
}

output "URL1" {
  value = "URL - ${var.URL}"
}

variable "list1" {
  default = [10,20,"str",false]
}

variable "map1" {
  default = {
    aws = {
      trainer = "John"
      duration = 30
    }
    devops = {
      trainer = "Steve"
      duration = 20
    }
  }
}

output "list1_1" {
  value = var.list1[3]
}

output "map1_1" {
  value = var.map1["aws"]["trainer"]
}