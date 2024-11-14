variable "vpc_id" {
  description = "ID de la VPC en la que desplegar el DocumentDB"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes para el DocumentDB"
  type        = list(string)
}

variable "cidr_blocks" {
  description = "Rango de CIDR para la política de seguridad de DocumentDB"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "cluster_identifier" {
  description = "Identificador del cluster de DocumentDB"
  type        = string
}

variable "db_username" {
  description = "Usuario maestro de la base de datos"
  type        = string
}

variable "db_password" {
  description = "Contraseña del usuario maestro de la base de datos"
  type        = string
  sensitive   = true
}

variable "instance_count" {
  description = "Número de instancias del cluster de DocumentDB"
  type        = number
  default     = 1
}

variable "instance_class" {
  description = "Clase de la instancia de DocumentDB"
  type        = string
  default     = "db.r5.large"
}