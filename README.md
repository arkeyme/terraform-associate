# Preparation for HashiCorp Infrastructure Automation Certification

https://www.hashicorp.com/certification/terraform-associate
https://www.youtube.com/watch?v=3WQMSQBUBuQ

## How to find AMIs

```aws ec2 describe-images --region eu-north-1 --owners amazon --filters  "Name=virtualization-type,Values=hvm" "Name=name,Values=amzn2-ami-hvm-2.0*"```

```aws ec2 describe-images --region eu-north-1 --owners amazon --filters  "Name=virtualization-type,Values=hvm"```

You should check `OwnerId` and `Name` of the found image


## aws-vault

[Link to github](https://github.com/99designs/aws-vault)   
[Medium Article](https://medium.com/@alfonso_cabrera/terraform-security-with-aws-vault-901b64c72003)

Create user with well known credentials:

```aws-vault add mainUser```

To run terraform under this user:
```aws-vault exec mainUser -- terraform apply```

To login to AWS console:
```aws-vault login```

To check environment

```aws-vault exec mainUser -- env | grep AWS```

Notice that `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are different then added in first step
