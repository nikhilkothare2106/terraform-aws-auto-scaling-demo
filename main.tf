module "vpc" {
  source     = "./modules/network/vpc"
  vpc_config = var.vpc_config

}

module "subnet" {
  source        = "./modules/network/subnet"
  subnet_config = var.subnet_config
  vpc_id        = module.vpc.vpc_id
}

module "igw" {
  source = "./modules/network/igw"
  vpc_id = module.vpc.vpc_id
}


module "eip" {
  source = "./modules/network/eip"
  azs    = module.subnet.azs
}

module "nat" {
  source = "./modules/network/nat"
  eips   = module.eip.eips
  # public_subnet_az = local.public_subnet_az
  public_subnets_az = module.subnet.public_subnets_az
}

module "rt" {
  source          = "./modules/network/rt"
  vpc_id          = module.vpc.vpc_id
  igw_id          = module.igw.igw_id
  private_subnets = module.subnet.private_subnets
  public_subnets  = module.subnet.public_subnets
  nats            = module.nat.nats
  azs             = module.subnet.azs
}

module "security_grp" {
  source = "./modules/security_grp"
  vpc_id = module.vpc.vpc_id
}

module "target_grp" {
  source = "./modules/load_balancing/target_grp"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source            = "./modules/load_balancing/alb"
  lg_sg_id          = module.security_grp.lg_sg_id
  public_subnets_az = module.subnet.public_subnets_az
  alb_name          = var.alb_name
}

module "listener" {
  source       = "./modules/load_balancing/listener"
  alb_arn      = module.alb.alb_arn
  tg_hello_arn = module.target_grp.tg_hello_arn
  tg_hi_arn    = module.target_grp.tg_hi_arn
}

module "listener_rule" {
  source       = "./modules/load_balancing/listener_rule"
  listener_arn = module.listener.listener_arn
  tg_hello_arn = module.target_grp.tg_hello_arn
  tg_hi_arn    = module.target_grp.tg_hi_arn
}

module "launch_template" {
  source        = "./modules/auto_scaling/launch_template"
  private_sg_id = module.security_grp.private_sg_id
  ami_id        = var.ami_id
}
module "asg" {
  source           = "./modules/auto_scaling/asg"
  asg_min_size     = var.asg_min_size
  asg_max_size     = var.asg_max_size
  desired_capacity = var.desired_capacity
  hello_lt_id      = module.launch_template.hello_lt
  hi_lt_id         = module.launch_template.hi_lt
  private_subnets  = module.subnet.private_subnets
  tg_hello_arn     = module.target_grp.tg_hello_arn
  tg_hi_arn        = module.target_grp.tg_hi_arn
}