resource "aws_iam_user" "user" {
  count = 35
  path  = "/system/"
  name  = "iamuser.${count.index}"

}

output "arns" {
  value = aws_iam_user.user[*].arn
}