provider "cloudfoundry" {
  api_url  = var.cf_api
  user     = var.cf_username
  password = var.cf_password
}

provider "random" {
}

provider "hsdp" {
  region        = var.cf_region
  environment   = "client-test"
  uaa_username  = var.cf_username
  uaa_password  = var.cf_password
  cartel_token  = var.cartel_token
  cartel_secret = var.cartel_secret
  cartel_host   = var.cartel_host

  debug     = true
  debug_log = "/tmp/vh.log"
}
