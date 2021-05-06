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


resource "aws_instance" "ins1" {
  ami           = data.aws_ami.amazon.id
  instance_type = var.istest == true ? "t3.nano" : "t3.micro"
  count         = 6
  tags = {
    Name = element(var.tags, count.index)
  }
}

output "ami" {
  value = lookup(var.ami, var.aws_region)
}

output "timestamp" {
  value = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}


data "aws_availability_zones" "azs" {
  state = "available"
}

output "azs" {
  value = data.aws_availability_zones.azs.names
}

resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}

output "names" {
  value = aws_iam_user.lb[*].name
}

# output "zipmap" {
#   value = aws_iam_user.lb[*].name
# }