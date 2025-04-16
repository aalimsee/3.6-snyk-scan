module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1" # Lock the version you want

  name = var.vpc_name
  cidr = "14.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["14.0.1.0/24", "14.0.2.0/24", "14.0.3.0/24"]
  public_subnets  = ["14.0.101.0/24", "14.0.102.0/24", "14.0.103.0/24"]

  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Created_by  = var.created_by
    Cohort      = "CE9"
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}