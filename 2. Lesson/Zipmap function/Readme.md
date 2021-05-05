# Zipmap Function

[zipmap Function](https://www.terraform.io/docs/language/functions/zipmap.html)


`zipmap` constructs a map from a list of keys and a corresponding list of values.

```hcl 

data "aws_availability_zones" "azs" {
    state = "available"
}

```

Run ```terraform console``` and type

```
zipmap(["first", "second", "third"], data.aws_availability_zones.azs.names)
tomap({
  "first" = "eu-north-1a"
  "second" = "eu-north-1b"
  "third" = "eu-north-1c"
})
```

