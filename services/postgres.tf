variable "create_postgres" {
  type    = bool
  default = {{ values.db | dump }}
}

resource "aws_db_instance" "postgres" {
  identifier        = "${var.component_id}-postgres"
  engine            = "postgres"
  engine_version    = "16"
  instance_class    = "db.t4g.micro"
  allocated_storage = 20

  db_name  = replace(var.component_id, "-", "_")
  username = var.db_username
  password = var.db_password

  skip_final_snapshot = true
}