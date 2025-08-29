# this is the resource to be created
resource "aws_instance" "this" {
  ami                     = local.instance_ami
  instance_type           = var.instance_type
}
# this is the resource to be imported
resource "aws_instance" "import" {
  ami                     = local.instance_ami
  instance_type           = var.instance_type
  tags = {
    Name = "terraform-instance-import"
  }
  user_data_replace_on_change = false
}
