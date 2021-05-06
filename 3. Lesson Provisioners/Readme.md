# Terraform provisioners

Remote provisioner:

```hcl
provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx"
    ]

  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("./EC2_Tutor-eu-north-1")
  }
  }
```
Local Provisioners:
```hcl
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ips.txt"
  }
    provisioner "local-exec" {
    command = "echo ${self.public_ip} >> private_ips.txt"
  }
```