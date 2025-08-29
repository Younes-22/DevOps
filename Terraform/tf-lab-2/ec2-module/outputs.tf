output "WordpressEc2_public_ip" {
  value = aws_instance.WordpressEc2.public_ip
  description = "value of thepublic ip address of the ec2 instance"
}