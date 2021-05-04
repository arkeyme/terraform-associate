resource "aws_instance" "dev" {
  ami           = data.aws_ami.amazon.id
  instance_type = var.instance_types["small"]
  count         = var.istest == true ? 1 : 0
  # Если переменная var.istest равно True то значение count становится 1, иначе 0
}

resource "aws_instance" "prod" {
  ami           = data.aws_ami.amazon.id
  instance_type = var.instance_types["mid"]
  count         = var.istest != true ? 1 : 0
  # Если переменная var.istest не равно True то значение count становится 1, иначе 0
}

resource "aws_instance" "devprod" {
  ami           = data.aws_ami.amazon.id
  instance_type = var.istest == true ? var.instance_types["small"] : var.instance_types["mid"]
  # Если переменная var.istest равно True то значение instance_type становится "t2.micro", иначе "t2.large"
}
