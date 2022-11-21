# Resource Block to create VPC in us-east-1 by using default provider

resource "aws_vpc" "vpc-us-east-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "vpc-us-east-1"
  }
}