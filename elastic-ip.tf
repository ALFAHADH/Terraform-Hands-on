resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "terraform-nat-eip"
  }
}

resource "aws_eip" "ec2_jumphost_eip" {
    domain = "vpc"
    tags = {
    Name = "terraform-ec2-jumphost-eip"
  }
}