resource "aws_db_subnet_group" "this" {
  name       = "${var.identifier}-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.identifier}-subnet-group"
  }
}

resource "aws_security_group" "this" {
  name        = "${var.identifier}-rds-sg"
  description = "Allow MySQL traffic from EC2 SG"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ec2_sg_id]
    description     = "MySQL from EC2 SG"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound"
  }
}

resource "aws_db_instance" "this" {
  identifier              = var.identifier
  allocated_storage       = var.allocated_storage
  storage_type            = var.storage_type
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.db_instance_class
  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [aws_security_group.this.id]

  tags = {
    Name = var.identifier
  }
}
