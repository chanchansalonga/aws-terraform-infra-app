#Usage of locals 
#[env]-[project]-[component]

module "network" {
  source               = "../../modules/network"

  name_prefix          = "${local.env}-${local.app}"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = ["${local.region}a", "${local.region}b"]
}

