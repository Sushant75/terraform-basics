# Create EC2 Instance - Amazon Linux
resource "aws_instance" "my-ec2-vm" {
  ami                    = data.aws_ami.amzlinux.id
  instance_type          = var.ec2_instance_type
  key_name               = "terraform-key"
  count                  = terraform.workspace == "default" ? 2 : 1
  user_data              = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "vm-${terraform.workspace}-${count.index}"
  }

  # PLAY WITH /tmp folder in EC2 Instance with file provisioner

  # Connection block for provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/terraform-key.pem")
  }

  # Copies the file-copy.html file to /tmp/file-copy.html
  provisioner "file" {
    source      = "apps/file-copy.html"
    destination = "/tmp/file-copy.html"
  }

  # Copies the string in content to /tmp/file.log

  provisioner "file" {
    content     = "ami used: ${self.ami}"
    destination = "/tmp/file.log"
  }

  # Copies the app1 folder to /tmp - FOLDER copy

  provisioner "file" {
    source      = "apps/app1"
    destination = "/tmp"
  }

  provisioner "file" {
    source      = "apps/file-copy.html"
    destination = "/var/www/html/file-copy.html"
    on_failure = continue 
  }

}

