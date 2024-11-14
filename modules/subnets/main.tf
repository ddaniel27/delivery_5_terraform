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
