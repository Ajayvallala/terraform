/* variable "instances" {
  default = {
    mongodb  = "t2.micro"
    redis    = "t2.micro"
    mysql    = "t3.micro"
    rabbitmq = "t2.micro"
  }
 } */

variable "instances" {
  default = ["mongodb", "redis", "mysql", "rabbitmq"]
}