resource "aws_instance" "myec2" {
  ami           = data.aws_ami.amazon.id
  instance_type = "t3.micro"
  key_name      = var.key_name

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

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ips.txt"
  }
    provisioner "local-exec" {
    command = "echo ${self.public_ip} >> private_ips.txt"
  }
}

output "ip" {
  value = aws_instance.myec2.public_ip
}