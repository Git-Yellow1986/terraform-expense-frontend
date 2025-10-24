resource "aws_route53_record" "expense" {
  count = length(var.instance_names)
  # backend.learnaws.space
  zone_id = var.zone_id
  name    = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.instance_names[count.index]}"
  type    = "A"
  ttl     = 1
  # records nothing but IP
  records         = var.instance_names[count.index] == "frontend" ? [aws_instance.terraform[count.index].public_ip] : [aws_instance.terraform[count.index].private_ip]
  allow_overwrite = true
}
