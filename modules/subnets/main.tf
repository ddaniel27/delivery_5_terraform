resource "aws_subnet" "csbe_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = "172.31.254.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "csbe_subnet_2" {
  vpc_id            = var.vpc_id
  cidr_block        = "172.31.253.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
}

resource "aws_security_group" "db_sg_csbe_test" {
  name        = "sg_csbe_test_db"
  description = "Security group for csbe_test_dbs"
  vpc_id            = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 27017
    to_port     = 27017
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
