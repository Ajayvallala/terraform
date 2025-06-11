variable "instances" {
  default = ["mongodb", "redis", "rabbitmq"]
}

variable "ingress_ports" {
  default = [
    {
      from_port = 22
      to_port   = 22
      protocol = "tcp"
    },
    {
      from_port = 80
      to_port   = 80
      protocol = "tcp"
    },
    {
      from_port = 8080
      to_port   = 8080
      protocol = "tcp"
    }
  ]

}



