# Configure the AWS provider
provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "xebia_bucket_logs" {
  bucket = var.bucket_name
  acl    = "log-delivery-write"
}


resource "aws_s3_bucket" "xebia_bucket" {
  bucket = "xebia-bucket-test1232"
  acl    = "private"

  tags = {
    Name = "xebia-bucket"
    BU   = "Xebia-finance"
  }
  versioning {
    enabled = true
  }

  logging {
    target_bucket = aws_s3_bucket.xebia_bucket_logs.id
    target_prefix = "log/"
  }
}