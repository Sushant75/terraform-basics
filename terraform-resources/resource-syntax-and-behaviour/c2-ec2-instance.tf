# Create EC2 Instance

resource "aws_instance" "my-ec2-vm" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
  #availability_zone = "us-east-1a"
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "web"
    "tag1" = "Update-test-1"
  }
}