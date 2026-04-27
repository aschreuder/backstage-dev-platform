module "test_postgres" {
  source = "../modules/rds-postgres"

  service_name    = "test"
  owner           = "group:default/guests"
  engine_version  = "16"
  instance_class  = "db.t4g.micro"
  allocated_storage = 20
}