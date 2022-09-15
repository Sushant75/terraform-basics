# Terraform Block
terraform {
  required_version = "~> 1.2.9"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.30.0"
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default"
  region = var.aws_region
}