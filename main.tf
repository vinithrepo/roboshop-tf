module "components_vpc" {

  source    = "git::https://github.com/vinithrepo/tf-module-vpc.git"

  for_each = var.vpc

  cidr = each.value["cidr"]
  subnets = each.value["subnets"]
}
