terraform {
  backend "s3" {
    bucket = "xebia-bucket-trainer-bucket"
    key    = "terraform-route53.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_route53_zone" "epsilon_com" {
    name = "epsilon.com"
}

resource "aws_route53_record" "blog" {
    name = "blog.epsilon.com"
    zone_id = aws_route53_zone.epsilon_com.id
    type   = "CNAME"
    ttl   = "300"
    records = [var.alb_dns]
}