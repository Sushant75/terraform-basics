# Create EC2 Instance Resource

resource "aws_instance" "myec2vm" {
  ami = "ami-026b57f3c383c2eec"
  #instance_type = "t2.micro"
  instance_type = "t2.small"
  availability_zone = "us-east-1b"
  key_name = "terraform-key"
  tags = {
    "Name" = "State-Import-Demo"
  }
}

# Terraform Import Commands

# terraform import <resource_type>.<resource_local_name> <related_id>