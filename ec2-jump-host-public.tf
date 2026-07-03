resource "aws_instance" "ec2_jump_host" {
    ami      = "ami-0b6d9d3d33ba97d99" 
    instance_type = "t3.small"

    associate_public_ip_address = false
    
    subnet_id = aws_subnet.public_subnet.id
    availability_zone = "us-east-1a"

    key_name = aws_key_pair.ssh_key.key_name

    vpc_security_group_ids = [
        aws_security_group.security_group.id
    ]

    tags = {
        Name = "terraform-ec2-jump-host"
    }
    
}

resource "aws_eip_association" "eip_association" {
    instance_id   = aws_instance.ec2_jump_host.id
    allocation_id = aws_eip.ec2_jumphost_eip.id
}