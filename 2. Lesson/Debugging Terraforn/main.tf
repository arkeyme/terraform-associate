terraform {
  backend "s3" {
    bucket         = "terra-back-1339"
    key            = "cert-lesson-2/terraform.tfstate"
    region         = "eu-north-1"
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

variable "istest" {
  type    = bool
  default = true
}

resource "aws_instance" "dev" {
  ami           = data.aws_ami.amazon.id
  instance_type = var.instance_types["small"]
  count         = var.istest == true ? 1 : 0
  # Если переменная var.istest равно True то значение count становится 1, иначе 0
}

resource "aws_instance" "prod" {
  ami           = data.aws_ami.amazon.id
  instance_type = var.instance_types["mid"]
  count         = var.istest != true ? 1 : 0
  # Если переменная var.istest не равно True то значение count становится 1, иначе 0
}

resource "aws_instance" "devprod" {
  ami           = data.aws_ami.amazon.id
  instance_type = var.istest == true ? var.instance_types["small"] : var.instance_types["mid"]
  # Если переменная var.istest равно True то значение instance_type становится "t2.micro", иначе "t2.large"
}

