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

variable "instance_types" {
  type = map(any)
  default = {
    small = "t3.micro"
    mid   = "t3.nano"
  }
}


variable "loadbalancers" {
  type    = list(any)
  default = ["dev-lb", "prod-lb", "stage-lb", "poo-lb"]

}

variable "istest" {
  type    = bool
  default = true
}