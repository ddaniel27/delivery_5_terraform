resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "csbe_test_db_subnet_group"
  }
}

resource "aws_security_group" "db_sg_csbe_test" {
  name        = "csbe_test_db_sg"
  description = "Security group for csbe_test_db"
  vpc_id            = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "csbe_test_db" {
  identifier              = var.db_name
  engine                  = "postgres"
  engine_version          = "16.4"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = var.db_username
  password                = var.db_password
  vpc_security_group_ids  = [aws_security_group.db_sg_csbe_test.id]
  skip_final_snapshot     = true
  publicly_accessible     = true
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  multi_az                = false

  tags = {
    Name = "csbe_test_db"
  }
}
