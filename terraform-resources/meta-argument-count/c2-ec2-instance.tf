# Create EC2 Instance

resource "aws_instance" "web" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  count         = 5
  tags = {
    "Name" = "web-${count.index}"
  }
}