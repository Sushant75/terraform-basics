# AWS EC2 Instance Module

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "my-modules-demo"

  ami                    = data.aws_ami.amzlinux.id
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  monitoring             = true
  vpc_security_group_ids = ["sg-01cd577e895490ed0"]   # Default Security Group
  subnet_id              = "subnet-0d5c6bc51cd78cbd9" # Get the subnet id from any of the default vpc
  user_data              = file("apache-install.sh")
  tags = {
    Name        = "Modules-Demo"
    Terraform   = "true"
    Environment = "dev"
  }
}