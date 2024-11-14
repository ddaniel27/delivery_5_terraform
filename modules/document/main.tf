resource "aws_docdb_subnet_group" "documentdb_subnet_group" {
  name       = "documentdb-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "documentdb-subnet-group"
  }
}

resource "aws_docdb_cluster" "documentdb" {
  cluster_identifier      = var.cluster_identifier
  engine                 = "docdb"
  master_username        = var.db_username
  master_password        = var.db_password
  db_subnet_group_name   = aws_docdb_subnet_group.documentdb_subnet_group.name
  vpc_security_group_ids = [var.security_group_id]
  preferred_backup_window = "07:00-09:00"
  backup_retention_period = 7
  final_snapshot_identifier = "${var.cluster_identifier}-final-snapshot"

  tags = {
    Name = var.cluster_identifier
  }
}

resource "aws_docdb_cluster_instance" "documentdb_instance" {
  count                  = var.instance_count
  cluster_identifier     = aws_docdb_cluster.documentdb.id
  instance_class         = var.instance_class
  engine                 = "docdb"
  publicly_accessible    = false

  tags = {
    Name = "${var.cluster_identifier}-instance-${count.index}"
  }
}
