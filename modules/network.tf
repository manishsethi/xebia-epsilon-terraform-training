##### Data sources: resources in Archimedes' primary region
################################################################################
### Primary VPC
data "aws_vpc" "archimedes_primary" {
  provider = aws.production
  id       = var.vpc_primary_id
}

### Public subnets in Primary VPC
data "aws_subnet" "archimedes_primary_public_a" {
  provider = aws.production
  id       = var.subnet_primary_public_a_id
}
data "aws_subnet" "archimedes_primary_public_b" {
  provider = aws.production
  id       = var.subnet_primary_public_b_id
}
data "aws_subnet" "archimedes_primary_public_c" {
  provider = aws.production
  id       = var.subnet_primary_public_c_id
}
