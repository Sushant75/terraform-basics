# Input Variables

variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"
}

# variable "ec2_ami_id" {
#   description = "AMI ID"
#   type = string 
#   default = "ami-026b57f3c383c2eec"
# }

variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}