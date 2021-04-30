terraform {
  backend "s3" {
    bucket = "terra-back-1339"
    key    = "cert-lesson-2/terraform.tfstate"
    region = "eu-north-1"
    dynamodb_table = "terraform_lock"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  } 
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

data "aws_ami" "amazon" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

owners = ["137112412989"]

}

output "ami_id" {
  value = data.aws_ami.amazon.id
}

resource "aws_instance" "web" {
  ami = data.aws_ami.amazon.id
  instance_type = var.instance_type
}

resource "aws_eip" "eip1" {
  instance = aws_instance.web.id
}

output "public_ip" {
  value = aws_eip.eip1.public_ip
}