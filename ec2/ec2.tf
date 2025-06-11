resource "aws_instance" "demo-terraform" {
  ami                         = "ami-09c813fb71547fc4f"
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.allow_all.id]
  subnet_id                   = "subnet-07d9ef0ea659b9697"
  associate_public_ip_address = "true"

  tags = {
    Name = "Demo-terrafrom"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound and outbound traffic"

  tags = {
    Name = "allow_all"
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

