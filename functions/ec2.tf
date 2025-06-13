resource "aws_instance" "roboshop" {
  count                  = length(var.instances)
  ami                    = var.ami_id
  instance_type          = var.instance_type == "mysql" ? "t3.micro" : "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.Roboshop-sg.id]
  tags = merge(
    var.common_tags, {
      Name      = var.instances[count.index]
      Component = var.instances[count.index]
    }
  )

}

resource "aws_security_group" "Roboshop-sg" {
  name        = "Allow-all"
  description = "Allowing all traffic"

  tags = merge(
    var.common_tags, {
      Name = "Allow-All"
    }
  )

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