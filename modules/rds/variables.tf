variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "db_name" {
  description = "Database name for RDS instance"
  type        = string
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

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}
