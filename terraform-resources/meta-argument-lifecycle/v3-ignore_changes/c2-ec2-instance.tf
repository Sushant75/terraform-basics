# Create EC2 Instance
resource "aws_instance" "web" {
  ami               = "ami-0b0dcb5067f052a63"
  instance_type     = "t2.micro"
  tags = {
    "Name" = "web-2"
  }
  lifecycle {
    ignore_changes = [
      instance_type,
      tags
    ]
  }
  
}