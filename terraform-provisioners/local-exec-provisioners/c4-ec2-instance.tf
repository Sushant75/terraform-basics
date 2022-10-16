# Create EC2 Instance - Amazon Linux
resource "aws_instance" "my-ec2-vm" {
  ami           = data.aws_ami.amzlinux.id
  instance_type = var.ec2_instance_type
  key_name      = "terraform-key"
  #count                  = terraform.workspace == "default" ? 2 : 1
  user_data              = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "vm-${terraform.workspace}"
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

  # local-exec provisioner (Creation Time provisioner)

  provisioner "local-exec" {
    command     = "echo ${aws_instance.my-ec2-vm.private_ip} >> creation-time-private-ip.txt"
    working_dir = "local-exec-output-files/"
    # on_failure = continue
  }

  # local-exec provisioner (Destroy Time provisioner)

  provisioner "local-exec" {
    when        = destroy
    command     = "echo Destroy-time provisioner Instance destroyed at `date` >> destroy-time.txt"
    working_dir = "local-exec-output-files/"
  }
}

