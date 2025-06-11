resource "aws_instance" "roboshop" {
  for_each               = toset(var.instances)
  ami                     = "ami-09c813fb71547fc4f"
  #instance_type          = each.value
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  subnet_id              = "subnet-07d9ef0ea659b9697"
  tags = {
    Name = each.key
  }
}

resource "aws_security_group" "allow-all" {
  name        = "allow-all"
  description = "Allow-All-Traffic"
  tags = {
    name = "allow-all"
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