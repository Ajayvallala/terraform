variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {
  default = "subnet-07d9ef0ea659b9697"
}

variable "instance_tag" {
  default = "roboshop"
}

variable "sg_name" {
  default = "allow_all"
}

variable "sg_description" {
  default = "Allow all traffic"
}

variable "sg_tag" {
  default = "allow_all"
}

variable "from_port" {
  type    = number
  default = 0
}

variable "to_port" {
  type    = number
  default = 0
}

variable "protocol" {
  default = "-1"
}

variable "pub_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "private_cidr" {
  type    = list(string)
  default = ["::/0"]
}