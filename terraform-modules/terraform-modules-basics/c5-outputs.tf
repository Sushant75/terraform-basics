# Output Variable Definition

output "ec2_instance_public_ip" {
  description = "Public IP addresses of EC2 Instances"
  value       = module.ec2_instance.public_ip
}

output "ec2_instance_public_dns" {
  description = "Public DNS for EC2 Instances"
  value       = module.ec2_instance.public_dns
}

output "ec2_instance_private_ip" {
  description = "Private IP addresses of EC2 Instances"
  value       = module.ec2_instance.private_ip
}