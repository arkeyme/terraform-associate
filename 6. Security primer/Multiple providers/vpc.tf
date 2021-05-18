resource "aws_eip" "eip1" {
}

resource "aws_eip" "eip2" {
  provider = aws.west2
}