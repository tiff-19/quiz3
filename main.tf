provider "aws" {
  region = var.REGION
}

resource "aws_instance" "module_instance" {
  ami               = var.AMIS
  instance_type     = var.INSTANCE_TYPE
  key_name          = var.KEY_NAME
  security_groups   = [aws_security_group.allow_ssh_http_mysql.id]
  subnet_id         = [aws_subnet.quiz3-public-1.id, aws_subnet.quiz3-public-2.id, aws_subnet.quiz3-public-3.id]

  tags = {
    Name = var.INSTANCE_NAME
  }
}