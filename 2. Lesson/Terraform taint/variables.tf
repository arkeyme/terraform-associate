variable "aws_region" {
  default = "eu-north-1"
}

variable "ports" {
  type    = list(number)
  default = ["220", "8080", "8081", "443"]
}

variable "istest" {
  type    = bool
  default = true
}

variable "instance_types" {
  type = map(any)
  default = {
    small = "t3.micro"
    mid   = "t3.nano"
  }
}
