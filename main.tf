module "vpc" {

  source    = "git::https://github.com/vinithrepo/tf-module-vpc.git"

  for_each = var.vpc

  cidr = each.value["cidr"]
  subnets = each.value["subnets"]
  default_vpc_id = var.default_vpc_id
  default_vpc_cidr = var.default_vpc_cidr
  default_route_table_id = var.default_route_table_id
}

output "vpc" {
  value = module.vpc
}