variable "URL" {
  default = "var.example.com"
}

output "URL" {
  value = var.URL
}

output "URL1" {
  value = "URL - ${var.URL}"
}