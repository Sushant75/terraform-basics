# Input Variable Definition

variable "aws_region" {
  description = "Region where we want to deploy our resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "tags" {
  description = "Tags to set on the bucket"
  type        = map(string)
  default     = {}
}