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
