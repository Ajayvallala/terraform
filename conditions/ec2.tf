resource "aws_instance" "roboshop" {
  ami             = var.ami_id
  instance_type   = var.envirnoment == "dev" ? "t2.micro" : "t3.micro"
  subnet_id       = var.subnet_id
  security_groups = [aws_security_group.allow-all.id]
  tags = {
    Name        = var.instance_tag

  }


}

resource "aws_security_group" "allow-all" {
  name        = var.sg_name
  description = var.sg_description

  tags = {
    name = var.sg_tag
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}