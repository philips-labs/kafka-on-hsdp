output "kafdrop_url" {
  value = "https://${cloudfoundry_route.kafdrop.endpoint}"
}
