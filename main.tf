module "zookeeper" {
  source = "philips-labs/zookeeper/hsdp"
  version = "0.8.0"

  bastion_host  = var.bastion_host
  nodes         = var.zookeeper_nodes
  user          = var.cf_username
  user_groups   = [var.cf_username]
  private_key   = file(var.private_key_file)
  instance_type = var.zookeeper_instance_type
  trust_store = {
    truststore = var.zoo_trust_store_file
    password   = var.ssl_pass
  }
  key_store = {
    keystore = var.zoo_key_store_file
    password = var.ssl_pass
  }

}

module "kafka" {
  source = "philips-labs/kafka/hsdp"
  version = "0.8.0"

  bastion_host      = var.bastion_host
  nodes             = var.kafka_nodes
  user              = var.cf_username
  user_groups       = [var.cf_username]
  private_key       = file(var.private_key_file)
  instance_type     = var.kafka_instance_type
  zookeeper_connect = "${element(module.zookeeper.zookeeper_nodes, 0)}:${module.zookeeper.zookeeper_port}"

  zoo_trust_store = {
    truststore = var.zoo_trust_store_file
    password   = var.ssl_pass
  }
  zoo_key_store = {
    keystore = var.zoo_key_store_file
    password = var.ssl_pass
  }

  kafka_trust_store = {
    truststore = var.kafka_trust_store_file
    password   = var.ssl_pass
  }
  kafka_key_store = {
    keystore = var.kafka_key_store_file
    password = var.ssl_pass
  }

}
