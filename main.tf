provider "aws" {
  region = var.aws_region
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = var.vpc_id
}

module "rds" {
  source = "./modules/rds"
  vpc_id = var.vpc_id
  db_username = var.db_username
  db_password = var.db_password
  db_name = var.db_name
  subnet_ids = module.subnets.csbe_subnet_ids
}

module "eks" {
  source = "./modules/eks"
  vpc_id = var.vpc_id
  cluster_name = var.cluster_name
  subnet_ids = module.subnets.csbe_subnet_ids
  node_group_name = var.node_group_name
  depends_on = [module.subnets]
}

module "api_gateway" {
  source = "./modules/api"
  vpc_id = var.vpc_id
  subnet_ids = module.subnets.csbe_subnet_ids
  depends_on = [module.subnets]
}
