variable "cf_username" {
  type        = string
  description = "Cloud foundry username"
}

variable "cf_password" {
  type        = string
  description = "Cloud foundry password"
}

variable "cf_api" {
  default     = "https://api.eu1.phsdp.com"
  type        = string
  description = "Cloud foundry API endpoint (region specific)"
}

variable "cf_org" {
  type        = string
  description = "Cloud foundry ORG name"
}

variable "cf_space" {
  type        = string
  description = "Cloud foundry space to provision Kafdrop in"
}

variable "cf_region" {
  type        = string
  default     = "eu-west"
  description = "Cloud foundry region"
}

variable "cf_domain" {
  type        = string
  default     = "eu-west.philips-healthsuite.com"
  description = "Default Cloud foundry domain to use for apps"
}

variable "name_postfix" {
  type        = string
  default     = ""
  description = "Optional postfix to append in routes"
}

variable "private_key_file" {
  type        = string
  description = "SSH private key. Used to access SSH bastion host"
}

variable "bastion_host" {
  type        = string
  description = "Bastion Host to use (region specific)"
  default     = "gw-eu1.phsdp.com"
}

variable "cartel_host" {
  type        = string
  description = "Cartel API host (region specific)"
  default     = "cartel-eu1.cloud.phsdp.com"
}

variable "cartel_token" {
  type        = string
  description = "Cartel token to use for Container Host"
}

variable "cartel_secret" {
  type        = string
  description = "Cartel secret to use for Container Host"
}

variable "zookeeper_instance_type" {
  type        = string
  description = "The EC2 instance type to use for Zookeeper servers"
  default     = "t2.medium"
}

variable "kafka_instance_type" {
  type        = string
  description = "The EC2 instance type to use for Kafka nodes"
  default     = "t3.large"
}

variable "kafka_nodes" {
  type        = number
  description = "Number of Kafka nodes to spin up"
  default     = 1
}

variable "zookeeper_nodes" {
  type        = number
  description = "Number of Zookeeper nodes to spin up"
  default     = 1
}


variable "zoo_trust_store_file" {
  type = string
  description = "file path of the zookeeper trust store"
}

variable "kafka_trust_store_file" {
  type = string
  description = "file path of the kafka trust store"
}

variable "zoo_key_store_file" {
  type = string
  description = "file path of the zookeeper key store"
}

variable "kafka_key_store_file" {
  type = string
  description = "file path of the kafka key store"
}

variable "kafka_properties_file" {
  type = string
  description = "file path of the kafka properties file"
}

variable "kafdrop_key_store_file" {
  type = string
  description = "file path of the kafkadrop key store"
}


variable "ssl_pass" {
  type = string
  description = "one pass for all of the keys and stores"
}

