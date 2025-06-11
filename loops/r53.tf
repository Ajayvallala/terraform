resource "aws_route53_record" "vallalas_store" {
    count = length(var.instances)
  zone_id = "Z0638351DE255MIV6AWU"
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[count.index].private_ip]
}