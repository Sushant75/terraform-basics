# Create S3 Bucket with environment with for_each and maps

resource "aws_s3_bucket" "mys3bucket" {
  # for_each meta argument
  for_each = {
    dev  = "my-dapp-bucket-8121237812"
    qa   = "my-qapp-bucket-8121237812"
    stag = "my-sapp-bucket-8121237812"
    prod = "my-papp-bucket-8121237812"
  }

  bucket = "${each.key}-${each.value}"
  acl    = "private"

  tags = {
    Environment = each.key
    bucketname  = "${each.key}-${each.value}"
    eachvalue   = each.value
  }
}