{% if values.useDb %}
resource "aws_db_instance" "default" {
  allocated_storage    = 20
  identifier           = "${{ values.name }}-db"
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  # ... rest of your config
}
{% endif %}