variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "cluster_identifier" {
  description = "Cluster DocumentDB identifier"
  type        = string
  default     = "docdb-cluster"
}

variable "db_username" {
  description = "Database username for DocumentDB"
  type        = string
}

variable "db_password" {
  description = "Database password for DocumentDB"
  type        = string
  sensitive   = true
}

variable "instance_count" {
  description = "Number of instances for DocumentDB"
  type        = number
  default     = 1
}

variable "instance_class" {
  description = "Instance class for DocumentDB"
  type        = string
  default     = "db.t3.medium"
}
