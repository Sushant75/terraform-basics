# Terraform Settings Block

terraform {
  required_version = "~> 1.3.1"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.33.0"
    }
  }
}

# Provider Block

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

# Resource Block

resource "aws_instance" "ec2demo" {
    ami = "ami-026b57f3c383c2eec"
    instance_type = "t2.micro"
}