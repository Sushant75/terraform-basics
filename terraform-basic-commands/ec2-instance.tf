# Terraform Block

terraform {
  required_version = "~> 1.2.9"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

# Providers Block

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

# AWS EC2 Instance

resource "aws_instance" "ec2demo" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t2.micro"
}