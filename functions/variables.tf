variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {
  default = "subnet-07d9ef0ea659b9697"
}

variable "instance_name" {
  default = "Roboshop"
}

variable "instances" {
  default = ["mongodb", "redis", "mysql"]
}

variable "common_tags" {
  default = {
    Project   = "Roboshop"
    Terraform = "true"
  }
}