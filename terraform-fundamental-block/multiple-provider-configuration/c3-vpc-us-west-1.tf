# Resource Block to create VPc in us-west-1

resource "aws_vpc" "vpc-us-west-1" {
  cidr_block = "10.0.0.0/16"
  provider   = aws.aws-west-1
  tags = {
    "Name" = "vpc-us-west-1"
  }
}