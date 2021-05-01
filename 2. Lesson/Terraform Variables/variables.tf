variable "instance_type" {
  description = "Instance type"
  default = "t2.micro"
}

variable "aws_region" {
  description = "Region"
  default     = "eu-north-1"
}


variable "elb_name" {
  default = "elb1"
}

# variable "az" {
#   type = list
#   default = ["us-west-2a", "us-west-2b", "us-west-2c"]
# }

variable "aws_region" {
  description = ""
  default     = "eu-north-1"
}

variable "types" {
  type = map(any)
  default = {
    us-east-1  = "t2.micro"
    us-west-2  = "t2.nano"
    eu-north-1 = "t3.micro"
  }

}
