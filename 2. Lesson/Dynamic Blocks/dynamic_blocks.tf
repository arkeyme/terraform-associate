resource "aws_security_group" "sg4" {
  name        = "sg4"

  dynamic "ingress" {
    for_each = var.ports
    content {
        from_port = ingress.value
        to_port = ingress.value
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "allow_tls"
  }
}
