variable "instance_type" {
  description = ""
  default = "t3.micro"
}

variable "instance_name" {
  description = ""
  default = "Wordpress"
}


variable "key_name" {
  description = ""
  default = "EC2_Tutor"
}


variable "github_token" {
  description = ""
}

variable "github_owner" {
  description = ""
}

variable "aws_region" {
  description = ""
  default = "eu-north-1"
}
