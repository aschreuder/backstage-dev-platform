variable "service_name" {
  type        = string
  description = "Name of the service that owns this database."
}

variable "owner" {
  type        = string
  description = "Owning team or Backstage owner reference."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the RDS security group will be created."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for the DB subnet group."
}

variable "allowed_security_group_ids" {
  type        = list(string)
  description = "Security groups allowed to connect to Postgres."
  default     = []
}

variable "engine_version" {
  type        = string
  description = "PostgreSQL engine version."
  default     = "16"
}

variable "instance_class" {
  type        = string
  description = "RDS instance class."
  default     = "db.t4g.micro"
}

variable "allocated_storage" {
  type        = number
  description = "Initial allocated storage in GB."
  default     = 20
}

variable "max_allocated_storage" {
  type        = number
  description = "Maximum autoscaled storage in GB."
  default     = 100
}

variable "storage_type" {
  type        = string
  description = "RDS storage type."
  default     = "gp3"
}

variable "database_name" {
  type        = string
  description = "Initial database name. Defaults to normalized service name."
  default     = null
}

variable "db_username" {
  type        = string
  description = "Master DB username."
  default     = "postgres_admin"
}

variable "multi_az" {
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  type        = number
  default     = 7
}

variable "deletion_protection" {
  type        = bool
  default     = false
}

variable "publicly_accessible" {
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  type        = bool
  default     = true
}

variable "tags" {
  type        = map(string)
  default     = {}
}