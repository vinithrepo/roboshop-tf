default_vpc_id         = "vpc-0e20cdadef7a7f85a"
default_vpc_cidr       = "172.31.0.0/16"
default_route_table_id = "rtb-0129d82e0b740825f"
env                    = "dev"
zone_id = "Z04190561TPDGJYVNCQTW"
shh_ingress_cidr = ["172.31.89.215/32"]

tags                   = {
  company        = "ABC Tech"
  bussiness_unit = "Ecommerce"
  Created_by     = "terraform"
  project_name   = "robot shop"
  cost_center    = "ecom_rs"
}


vpc = {
  main = {
    cidr    = "10.0.0.0/16"
    subnets = {
      public = {
        public1 = { cidr = "10.0.0.0/24", az = "us-east-1a" }
        public2 = { cidr = "10.0.1.0/24", az = "us-east-1b" }
      }
      app = {
        app1 = { cidr = "10.0.2.0/24", az = "us-east-1a" }
        app2 = { cidr = "10.0.3.0/24", az = "us-east-1b" }
      }
      db = {
        db1 = { cidr = "10.0.4.0/24", az = "us-east-1a" }
        db2 = { cidr = "10.0.5.0/24", az = "us-east-1b" }
      }
    }
  }
}

alb = {
  public = {
    internal = false
    lb_type = "application"
    sg_ingress_cidr = ["0.0.0.0/0"]
    sg_port = 80
  }
  private = {
    internal = true
    lb_type = "application"
    sg_ingress_cidr = ["10.0.0.0/16", "172.31.0.0/16"]
    sg_port = 80
  }
}
docdb = {
  main = {
    backup_retention_period = 5
    preferred_backup_window = "07:00-09:00"
    skip_final_snapshot     = true
    engine_version = "4.0.0"
    engine_family = "docdb4.0"
    instance_class = "db.t3.medium"
    instance_count = 1
  }
}
rds ={
  main = {
    rds_type  = "mysql"
    db_port   = 3306
    engine_family  = "aurora-mysql5.7" #you'll get this while creating  parameter group
    engine  = "aurora-mysql"
    engine_version  = "5.7.mysql_aurora.2.11.3"
    backup_retention_period  = 5
    preferred_backup_window  = "07:00-09:00"
    skip_final_snapshot     = true
    instance_class = "db.t3.small"
    instance_count = 1
  }
}
elasticache = {
  main = {
    elasticache_type = "redis"
    port = 6379
    family = "redis6.x"
    engine = "redis"
    node_type = "cache.t3.micro"
    num_cache_nodes = 1
    engine_version = "6.2"
}
}
rabbitmq = {
  main = {
    instance_type = "t3.small"
  }
}

apps  = {
  frontend = {
    instance_type = "t3.small"
    port  = 80
    desired_capacity   = 1
    max_size           = 3
    min_size           = 1
    lb_priority        = 1
    lb_type            = "public"
  }
  catalogue = {
    instance_type = "t3.small"
    port  = 8080
    desired_capacity   = 1
    max_size           = 3
    min_size           = 1
    lb_priority        = 2
    lb_type            = "private"
  }
  cart = {
    instance_type = "t3.small"
    port  = 8080
    desired_capacity   = 1
    max_size           = 3
    min_size           = 1
    lb_priority        = 3
    lb_type            = "private"
  }
  user = {
    instance_type = "t3.small"
    port  = 8080
    desired_capacity   = 1
    max_size           = 3
    min_size           = 1
    lb_priority        = 4
    lb_type            = "private"
  }
  payment = {
    instance_type = "t3.small"
    port  = 8080
    desired_capacity   = 1
    max_size           = 3
    min_size           = 1
    lb_priority        = 5
    lb_type            = "private"
  }
  shipping = {
    instance_type = "t3.small"
    port  = 8080
    desired_capacity   = 1
    max_size           = 3
    min_size           = 1
    lb_priority        = 6
    lb_type            = "private"
  }
}
