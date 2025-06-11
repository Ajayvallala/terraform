resource "aws_instance" "roboshop" {
  for_each               = toset(var.instances)
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-07d9ef0ea659b9697"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    Name = each.key
  }

}

resource "aws_security_group" "allow_all" {
  name        = "Allow-All"
  description = "All traffic"
  tags = {
    name = "allow-all"
  }

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = ingress.value["protocol"]
      cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}