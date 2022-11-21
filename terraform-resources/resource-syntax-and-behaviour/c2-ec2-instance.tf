# Create EC2 Instance

resource "aws_instance" "my-ec2-vm" {
  ami               = "ami-0b0dcb5067f052a63"
  instance_type     = "t2.micro"
  # availability_zone = "us-east-1a"
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "web"
    "Department" = "DevOps"
  }
}