# Security primer

## Multiple providers

For example for different regions:

```hcl
provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
  alias = "west2"
}
```
```hcl
resource "aws_eip" "eip1" {
}

resource "aws_eip" "eip2" {
  provider = aws.west2
}
```

## Sensitive parameters:

```hcl
output "db_password" {
  value       = aws_db_instance.db.password
  description = "The password for logging in to the database."
  sensitive   = true
}
```

```hcl
locals {
  db_password = {
      admin = "password"
  }
}

output "db_password" {
  value = local.db_password
  sensitive = true
}
```