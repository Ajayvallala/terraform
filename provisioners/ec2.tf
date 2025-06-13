resource "aws_instance" "roboshop" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-07d9ef0ea659b9697"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  associate_public_ip_address = true
  tags = {
    Name = "Provisioners-demo"
  }
  provisioner "local-exec" {

    command    = "echo ${self.public_ip} > inventory.ini"
    on_failure = continue

  }

  provisioner "local-exec" {

    command = "echo instance destroyed"
    when    = destroy
    on_failure = continue

  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = ["sudo dnf install nginx -y", "sudo systemctl start nginx"]
    on_failure = continue
  }

  provisioner "remote-exec" {
    when   = destroy
    inline = ["sudo systemctl stop nginx"]
    on_failure = continue
  }
}

resource "aws_security_group" "allow_all" {
  name        = "Allow-All"
  description = "All traffic"
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

