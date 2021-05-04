# Dynamic blocks

Dynamic block to add security group with rule for every port in list:   

```hcl
variable "ports" {
  type    = list(number)
  default = ["220", "8080", "8081", "443"]

}

resource "aws_security_group" "sg4" {
  name = "sg4"

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "allow_tls"
  }
}

```

For better reading let's add `iterator` option, which means that `iterator` is the `port` itself:

```hcl
resource "aws_security_group" "sg4" {
  name = "sg4"

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "allow_tls"
  }
}
```