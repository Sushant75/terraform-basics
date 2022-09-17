# Terraform Output Values

# EC2 Instance Public IP with TOSET
output "instance_publicip" {
  description = "EC2 instance public IP"
  value = [for instance in aws_instance.myec2vm: instance.public_ip]
}

# EC2 Instance Public DNS with TOSET
output "instance_publicdns" {
  description = "EC2 instance public DNS"
  value = toset([for instance in aws_instance.myec2vm: instance.public_dns])
}

# EC2 Instance Public DNS with TOMAP

output "instance_publicdns2_map" {
  description = "EC2 instance public DNS"
  value = tomap({for az, instance in aws_instance.myec2vm: az => instance.public_dns})
}