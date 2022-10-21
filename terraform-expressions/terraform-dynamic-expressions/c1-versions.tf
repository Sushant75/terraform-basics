# Terraform Block

terraform {
  required_version = "~> 1.3.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.35.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }
  }
}

# Provider Block

provider "aws" {
  region  = var.aws_region
  profile = "default"
}