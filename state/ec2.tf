resource "aws_instance" "roboshop" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-07d9ef0ea659b9697"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    Name = "state-demo"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow-all"
  description = "Allow all traffic"
  tags = {
    Name = "Allow-All"
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}