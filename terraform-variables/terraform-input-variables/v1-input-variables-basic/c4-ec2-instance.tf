# Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  ami                    = var.ec2_ami_id # Amazon linux-2 AMI
  instance_type          = "t3.micro"
  key_name               = "terraform-key"
  count                  = var.ec2_instance_count
  user_data              = file("${path.module}/apache-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "myec2vm"
  }
}