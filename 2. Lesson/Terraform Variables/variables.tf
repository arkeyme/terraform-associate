variable "instance_type" {
  description = ""
  default     = "t3.micro"
}

variable "instance_name" {
  description = ""
  default     = "Wordpress"
}


variable "key_name" {
  description = ""
  default     = "EC2_Tutor"
}


variable "aws_region" {
  description = ""
  default     = "eu-north-1"
}

variable "types" {
  type = map
  default = {
    us-east-1 = "t2.micro"
    us-west-2 = "t2.nano"
    eu-north-1 = "t2.small"
   }
  
}

