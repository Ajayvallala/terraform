resource "aws_instance" "roboshop" {

  ami                         = var.ami_id
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.allow_all.id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = var.instance_tag
  }

}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description

  tags = {
    Name = var.sg_tag
  }
  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.pub_cidr
    ipv6_cidr_blocks = var.private_cidr
  }
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.pub_cidr
    ipv6_cidr_blocks = var.private_cidr
  }
}



