variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "subnet_id" {
  default = "subnet-07d9ef0ea659b9697"
}

variable "instance_tag" {
  default = "roboshop"
}

variable "sg_name" {
  default = "allow-all"
}

variable "sg_description" {
  default = "Allow-all traffic"
}

variable "sg_tag" {
  default = "allow-all"
}
variable "envirnoment" {
  default = "prod"
}