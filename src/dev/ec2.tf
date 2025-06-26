module "ec2" {
  source = "../../modules/compute"

  env_str       = "dev"
  vpc_id_str    = module.network.vpc_id
  target_subnet = module.network.private_a_id
  tag_name      = "sample"
}
