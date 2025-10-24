resource "aws_instance" "terraform" {
  count         = length(var.instance_names)
  instance_type = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"
  ami = data.aws_ami.expense.id

  tags = merge(
    var.common_tags,
    {
      Name = var.instance_names[count.index]
    }
  )

}

resource "aws_security_group" "sg_group" {
  name        = "SSH-for-Security"
  description = "Allow all inbound trafic and outbound traffic"

  # egress {} , called block

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # Everything
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # Allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = merge(
    var.common_tags,
    {
      Name = "Allow SSH"
    }
  )
}

