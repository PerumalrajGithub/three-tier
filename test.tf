
############ PROVIDER BLOCK ############
provider "aws" {
  region     = "us-east-2"
  profile    = "default"
}
############ SAVING TF STATE FILE #########
terraform {
  backend "s3" {
    bucket  = "saraawsglue"

    key     = "atlantis/terraform.tfstate"
    region  = "us-east-2"
    profile = "default"
  }
}
################# EC2 INSTANCE CREATION #########
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["309603658721"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-atlantis"
  }
}
