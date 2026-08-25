data "aws_ami" "joindevops" {
    owners           = ["973714476881"]
    most_recent      = true
    
    filter {
        name   = "name"
        values = ["Redhat-9-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

output "ami_id" {
    value = data.aws_ami.joindevops.id
}

# data "aws_instance" "terraform" {
#     instance_id = "i-0808a94a2de282a9e"
# }

# output "terraform_publicip" {
#     value = data.aws_instance.terraform.public_ip
# }