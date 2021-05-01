variable "instance_type" {
  description = ""
  default     = "t3.micro"
}

variable "instance_name" {
  description = ""
  default     = "Wordpress"
}

variable "name" {
  default = "Host"
}

variable "default" {
  default = "Host"
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
  type = map(any)
  default = {
    us-east-1  = "t2.micro"
    us-west-2  = "t2.nano"
    eu-north-1 = "t3.small"
  }

}

variable "loadbalancers" {
  type = list
  default = ["dev-lb","prod-lb","stage-lb", "poo-lb"]
   
}