# Functions

[Built-in Functions](https://www.terraform.io/docs/language/functions/index.html)

## formatdate and timestamp
```hcl
timestamp()
"2021-05-03T20:15:29Z"
formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
"03 May 2021 20:16 UTC"
```
## element
This select tag for `Name` by `count.index` from variable `tags`
```hcl
resource "aws_instance" "ins1" {
  ami = data.aws_ami.amazon.id
  instance_type = "t3.nano"
  count = 6
  tags = {
    Name = element(var.tags, count.index)
  }
}
```
Variable:
```hcl
variable "tags" {
  type = list
  default = ["dev-lb","prod-lb","stage-lb", "poo-lb"]
}
```

## lookup
This is select `ami` from variable `ami` by `var.aws_region`
```
output "ami" {
  value = lookup(var.ami,var.aws_region)
}
```

Variable:
```hcl
variable "ami" {
  type = map(any)
  default = {
    us-east-1  = "ami-0fbd7e2032a73c4c2"
    us-west-2  = "ami-0fbd7e2032a73c4c2"
    eu-north-1 = "ami-0fbd7e2032a73c4c2"
  }
}
```