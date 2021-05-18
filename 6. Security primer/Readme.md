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


