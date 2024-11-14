resource "aws_security_group" "documentdb_sg" {
  name        = "documentdb-sg"
  description = "Security group for DocumentDB cluster"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

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
  vpc_security_group_ids = [aws_security_group.documentdb_sg.id]
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
