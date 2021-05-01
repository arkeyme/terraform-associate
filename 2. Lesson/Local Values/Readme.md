# Local Values

[Link](https://www.terraform.io/docs/language/values/locals.html)

```
# Если var.name не пустое, то name_prefix принимает значение var.name, иначе var.default (опеределено в variables.tf)
locals {
  name_prefix = var.name != "" ? var.name : var.default
}

# таг Name принимает значние local.name_prefix
locals {
  common_tags = {
    Owner = "DevOps team"
    service = "backend"
    Name = local.name_prefix
  }
}

resource "aws_instance" "prod" {
  ami           = data.aws_ami.amazon.id
  instance_type = "t2.large"
  count = var.istest != true ? 1 : 0
  # Если переменная var.istest не равно True то значение count становится 1, иначе 0
  tags = local.common_tags
}
```

