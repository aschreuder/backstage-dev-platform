module "customer_api_postgres" {
  source = "../modules/rds-postgres"

  service_name    = "customer-api"
  owner           = "group:default/guests"
  engine_version  = "16"
  instance_class  = "db.t4g.micro"
  allocated_storage = 20
}