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

variable "ami" {
  type = map(any)
  default = {
    us-east-1  = "ami-0fbd7e2032a73c4c2"
    us-west-2  = "ami-0fbd7e2032a73c4c2"
    eu-north-1 = "ami-0fbd7e2032a73c4c2"
  }
}

variable "loadbalancers" {
  type = list
  default = ["dev-lb","prod-lb","stage-lb", "poo-lb"]
}

variable "tags" {
  type = list
  default = ["dev-lb","prod-lb","stage-lb", "poo-lb"]
}
