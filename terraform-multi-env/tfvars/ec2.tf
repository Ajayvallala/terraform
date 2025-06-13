resource "aws_instance" "roboshop" {
  count                       = length(var.instances)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  associate_public_ip_address = true

  tags = merge(
    var.common_tags, {
      Name      = "${var.project}-${var.envirnoment}-${var.instances[count.index]}"
      Component = "${var.instances[count.index]}"
    }
  )
}


resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = "Allow all the traffic"

  tags = merge(
    var.common_tags,{
       Name      = "${var.project}-${var.envirnoment}-${var.sg_name}"
      
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