variable "instance_type" {
    type = string
}

locals {
    instance_ami = "ami-046c2381f11878233"
}
output "instance_id" {
  value = aws_instance.this.id
  description = "The ID of the EC2 instance"
}
