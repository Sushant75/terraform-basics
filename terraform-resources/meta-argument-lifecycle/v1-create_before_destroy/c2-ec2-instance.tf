# Create EC2 Instance
resource "aws_instance" "web" {
  ami               = "ami-0b0dcb5067f052a63"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  #availability_zone = "us-east-1b"
  tags = {
    "Name" = "web-1"
  }
  lifecycle {
    create_before_destroy = true
  }
  
}