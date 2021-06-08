provider "aws"{
    region = var.aws_region
}

resource "aws_instance" "xebia"{
    ami            = var.ec2_ami
    instance_type  = var.ec2_instancetype
} 