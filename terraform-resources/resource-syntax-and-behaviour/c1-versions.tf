# Terraform Block

terraform {
  required_version = "~> 1.3.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.33.0"
    }
  }
}

# Provider Block

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}