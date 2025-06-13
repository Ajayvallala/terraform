resource "aws_instance" "roboshop" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-07d9ef0ea659b9697"
  vpc_security_group_ids = [aws_security_group.roboshop-sg.id]
  tags = {
    Name = local.final_name
  }
}

resource "aws_security_group" "roboshop-sg" {
  name        = "SSH"
  description = "ssh access for remote connections"
  tags = {
    Name = "SHH-ACCESS"
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