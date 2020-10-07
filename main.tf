module "zookeeper" {
  source = "github.com/philips-labs/terraform-hsdp-zookeeper"

  bastion_host  = var.bastion_host
  nodes         = var.zookeeper_nodes
  user          = var.cf_username
  user_groups   = [var.cf_username]
  private_key   = file(var.private_key_file)
  instance_type = var.zookeeper_instance_type
}

module "kafka" {
  source = "github.com/philips-labs/terraform-hsdp-kafka"

  bastion_host      = var.bastion_host
  nodes             = var.kafka_nodes
  user              = var.cf_username
  user_groups       = [var.cf_username]
  private_key       = file(var.private_key_file)
  instance_type     = var.kafka_instance_type
  zookeeper_connect = "${element(module.zookeeper.zookeeper_nodes, 0)}:${module.zookeeper.zookeeper_port}"
}
