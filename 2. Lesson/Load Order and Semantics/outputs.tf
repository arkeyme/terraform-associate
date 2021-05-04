output "azs" {
  value = data.aws_availability_zones.azs.names
}

output "prod_ip" {
  value = aws_instance.prod[*].public_ip
  depends_on = [
    aws_instance.prod
  ]
}

output "dev_ip" {
  value = aws_instance.dev[0].public_ip
  depends_on = [
    aws_instance.dev
  ]
}

output "devprod_ip" {
  value = aws_instance.devprod.public_ip
  depends_on = [
    aws_instance.devprod
  ]
}

