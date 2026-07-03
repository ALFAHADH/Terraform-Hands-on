resource "aws_key_pair" "ssh_key" {
    key_name   = "aws-terraform-key"
    public_key = file("C:/Users/ADMIN/aws-terraform-key.pub")
}