variable "project" {
  default = "roboshop"
}
variable "envirnoment" {

}

variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "subnet_id" {
  default = "subnet-07d9ef0ea659b9697"
}
variable "instances" {
  default = ["mongodb", "redis"]
}

variable "instance_type" {

}

variable "sg_name" {
    default = "Allow_All"
}

variable "common_tags" {
  default = {
    project   = "roboshop"
    Terraform = "true"
  }

}