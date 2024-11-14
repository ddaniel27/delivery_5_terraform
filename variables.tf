# AWS General variables
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

# RDS variables
variable "db_name" {
  description = "Database name for RDS instance"
  type        = string
  default     = "csbe-test-db"
}

variable "db_username" {
  description = "Database username for RDS instance"
  type        = string
}

variable "db_password" {
  description = "Database password for RDS instance"
  type        = string
  sensitive   = true
}

# EKS variables
variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "csbe-test-cluster"
}

variable "node_group_name" {
  description = "EKS node group name"
  type        = string
  default     = "csbe-test-node-group"
}
