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

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon.id
  instance_type = var.instance_type
}

resource "aws_eip" "eip1" {
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.eip1.id
}

output "ami_id" {
  value = data.aws_ami.amazon.id
}

output "public_ip" {
  value = join("", [aws_eip.eip1.public_ip, "/32"])
}

resource "aws_instance" "web1" {
  count         = 1
  instance_type = var.types[var.aws_region]
  ami           = data.aws_ami.amazon.id
  tags = {
    Name = join("-", ["Host", count.index])
  }
}

resource "aws_iam_user" "user" {
  count = length(var.loadbalancers)
  name  = var.loadbalancers[count.index]
  path  = "/system/"
}

resource "aws_iam_user" "user2" {
  count = 6
  name = "user-${count.index}"
  path = "/system/"
}