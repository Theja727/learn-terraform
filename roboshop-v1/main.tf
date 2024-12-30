terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}
resource "aws_instance" "frontend" {
  ami="ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
}