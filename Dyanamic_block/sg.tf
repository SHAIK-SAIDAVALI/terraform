# resource "aws_instance" "terraform" {
#     ami =  var.ami_id
#     instance_type = var.instance_type
#     vpc_security_group_ids = [aws_security_group.allow_all.id]
#     tags = var.ec2_tags
# }

resource "aws_security_group" "allow_all" {
  name   = "${local.common_name}-allow_all"

  egress {
    from_port        = var.egress_from_port
    to_port          = var.egress_to_port
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = var.cidr
  }

  dynamic "ingress" {
    for_each = toset(var.ingress)
    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = var.cidr
    }  
  }

  tags = {
    Name = "${local.common_name}-allow_all"
  }

}