resource "aws_docdb_subnet_group" "documentdb_subnet_group" {
  name       = "documentdb-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "documentdb-subnet-group"
  }
}

resource "aws_docdb_cluster" "documentdb" {
  apply_immediately      = true
  cluster_identifier      = var.cluster_identifier
  engine                 = "docdb"
  master_username        = var.db_username
  master_password        = var.db_password
  db_subnet_group_name   = aws_docdb_subnet_group.documentdb_subnet_group.name
  vpc_security_group_ids = [var.security_group_id]
  preferred_backup_window = "07:00-09:00"
  backup_retention_period = 1
  port                   = 27017
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.parameter_group.name
  skip_final_snapshot    = true

  tags = {
    Name = var.cluster_identifier
  }
}

resource "aws_docdb_cluster_parameter_group" "parameter_group" {
  family      = "docdb5.0"
  name        = "pg-docdb"
  description = "docdb cluster parameter group"

  parameter {
    name  = "tls"
    value = "disabled"
  }
}

resource "aws_docdb_cluster_instance" "documentdb_instance" {
  count                  = var.instance_count
  cluster_identifier     = aws_docdb_cluster.documentdb.id
  instance_class         = var.instance_class
  engine                 = "docdb"

  tags = {
    Name = "${var.cluster_identifier}-instance-${count.index}"
  }
}
