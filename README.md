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


# Terraform workspaces

[link to the documentation](https://www.terraform.io/docs/language/state/workspaces.html#when-to-use-multiple-workspaces)

To create workspace, after creation new created WS became selected:

```
aws-vault exec mainUser -- terraform workspace new stage
```

To list WS:

```
aws-vault exec mainUser -- terraform workspace list
```

To select needed workspace:

```
aws-vault exec mainUser -- terraform workspace select default
```

Notice that terraform apply will create changes in different WS isolatevly. It possible by creating new state file in our S3 storage for workspace `stage`:

```
terra-back-1339/env:/stage/cert-lesson-2/cert-lesson-2/
```


