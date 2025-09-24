module "parameter" {
  source = "../../modules/parameter-store"

  parameter_name = "MyParameterStore"
  tag_name = "dev-parameter-store"
}
