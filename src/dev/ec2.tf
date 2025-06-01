module "ec2" {
  source = "../../modules/compute"

  target_subnet = module.network.private_a_id
  tag_name      = "sample"
}
