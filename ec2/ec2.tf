resource "aws_instance" "demo-terraform" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = "Demo-tf"
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

