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
  docker_image = "obsidiandynamics/kafdrop"
  environment = {
    KAFKA_BROKERCONNECT = "${element(module.kafka.kafka_nodes, 0)}:${module.kafka.kafka_port}"
    SERVER_PORT         = "8080"
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
