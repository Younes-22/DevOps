output "db_instance_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value = aws_db_instance.this.endpoint
}

output "db_instance_id" {
  description = "The ID of the RDS instance"
  value = aws_db_instance.this.id
}

output "db_security_group_id" {
  description = "The security group attached to the RDS instance"
  value = aws_security_group.rds_sg.id
}
