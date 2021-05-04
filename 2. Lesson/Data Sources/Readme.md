# Data Sources

```hcl
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
resource "aws_instance" "myec2" {
  ami = data.aws_ami.amazon.id
  instance_type = var.instance_type
}
```

Availability zones:

```
data "aws_availability_zones" "azs" {
    state = "available"
}
output "azs" {
  value = data.aws_availability_zones.azs.names
}
```