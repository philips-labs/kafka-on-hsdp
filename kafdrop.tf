data "cloudfoundry_org" "org" {
  name = var.cf_org
}
data "cloudfoundry_space" "space" {
  org  = data.cloudfoundry_org.org.id
  name = var.cf_space
}

data "cloudfoundry_domain" "domain" {
  name = var.cf_domain
}

resource "cloudfoundry_app" "kafdrop" {
  name         = "kafdrop"
  space        = data.cloudfoundry_space.space.id
  memory       = 1024
  disk_quota   = 2048
  docker_image = "skprasad/kafdrop"
  environment = {
    KAFKA_BROKERCONNECT = "${element(module.kafka.kafka_nodes, 0)}:${module.kafka.kafka_port}",
    SERVER_PORT         = "8080",
    KAFKA_TRUSTSTORE = "${filebase64("${var.kafka_trust_store_file}")}",
    KAFKA_PROPERTIES = "${filebase64("${var.kafka_properties_file}")}",
    KAFKA_KEYSTORE = "${filebase64("${var.kafdrop_key_store_file}")}",
    KAFKA_SECURITYPROTOCOL  = "SSL"
    }
  routes {
    route = cloudfoundry_route.kafdrop.id
  }
}

resource "cloudfoundry_route" "kafdrop" {
  domain   = data.cloudfoundry_domain.domain.id
  space    = data.cloudfoundry_space.space.id
  hostname = var.name_postfix == "" ? "kafdrop" : "kafdrop-${var.name_postfix}"
}
