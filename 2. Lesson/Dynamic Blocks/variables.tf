variable "aws_region" {
  default = "eu-north-1"
}

variable "ports" {
  type    = list(number)
  default = ["220", "8080", "8081", "443"]
}
