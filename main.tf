terraform {
  backend "s3" {
    bucket = "xebia-bucket-trainer-bucket"
    key    = "terraform_module.tfstate"
    region = "us-east-1"
  }
}

module "ec2" {
  source     = "./modules/ec2"
  aws_region = "us-east-1"

}