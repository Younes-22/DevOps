output "WordpressEc2_public_ip" {
  value       = aws_instance.WordpressEc2.public_ip
  description = "value of the public ip address of the ec2 instance"
}
output "WordpressEc2_instance_id" {
  value       = aws_instance.WordpressEc2.id
  description = "The ID of the EC2 instance"
}

