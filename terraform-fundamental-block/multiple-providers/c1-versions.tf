# Terraform Block
terraform {
  required_version = "~> 1.3.1"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.33.0"
    }
  }
}

# Provider-1 for us-east-1 (Default Provider)

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

# Provider-2 for us-west-1

provider "aws" {
  profile = "default"
  region = "us-west-1"
  alias = "aws-west-1"
}