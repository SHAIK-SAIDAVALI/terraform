resource "aws_instance" "frontend" {
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "t3.micro"
    # vpc_security_group_ids = [ "sg-0064149a4e8eb98ec" ]
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = {
        Name = "myvm"
        Terraform = "true"
    }
}

resource "aws_security_group" "allow_all" {
  name   = "allow_all"

  egress {
    from_port       = 0 ## All Ports ##
    to_port         = 0  
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]      #internet
  }

  ingress {
    from_port       = 0   ## All Ports ##
    to_port         = 0
    protocol        = "-1" # All Protoclos #
    cidr_blocks     =   ["0.0.0.0/0"]  #internet
  }
  tags = {
    Name= "allow_all"
  }
}