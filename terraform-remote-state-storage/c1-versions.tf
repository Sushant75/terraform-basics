# Terraform Block

terraform {
  required_version = "~> 1.3.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.34.0"
    }
  }

  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-seedersoft"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"

    # For state locking
    dynamodb_table = "terraform-dev-state-table"
  }
}


# Provider Block

provider "aws" {
  profile = "default"
  region  = var.aws_region
}