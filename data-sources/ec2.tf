resource "aws_instance" "roboshop" {
  ami                    = data.aws_ami.joindevops.id
  instance_type          = "t2.micro"
  subnet_id              = "subnet-07d9ef0ea659b9697"
  vpc_security_group_ids = [aws_security_group.roboshop_sg.id]
  tags = {
    Name = "roboshop"
  }
}

resource "aws_security_group" "roboshop_sg" {
  name = "Allow_SSH"
  description = "ssh traffic"
  tags = {
    Name = "allow_ssh"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}