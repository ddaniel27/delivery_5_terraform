resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "csbe_test_db_subnet_group"
  }
}

resource "aws_db_instance" "csbe_test_db" {
  identifier              = var.db_name
  engine                  = "postgres"
  engine_version          = "16.4"
  instance_class          = var.instance_class
  allocated_storage       = 20
  username                = var.db_username
  password                = var.db_password
  vpc_security_group_ids  = [var.security_group_id]
  skip_final_snapshot     = true
  publicly_accessible     = true
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  multi_az                = false

  tags = {
    Name = "csbe_test_db"
  }
}
