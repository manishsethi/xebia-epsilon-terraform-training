# Configure the AWS provider
provider "aws"{
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket"{
  bucket = "Xebia-bucket-manish"
  acl = "private"
  
  tags = {
   Name  = "My bucket"
   Environment = "Dev"
  }
}
