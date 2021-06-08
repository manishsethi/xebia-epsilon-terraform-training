# Configure the AWS provider
provider "aws"{
    region = "us-east-1"
}

resource "aws_s3_bucket" "xebia_bucket" {
    bucket = "xebia-bucket-test1232"
    acl    = "private"

    tags = {
        Name  =  "xebia-bucket"
        BU    =  "Xebia-finance"
    } 
}