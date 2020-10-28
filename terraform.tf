terraform {
  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = ">= 0.12.6"
    }
    random = {
      source = "random"
    }
    hsdp = {
      source  = "philips-software/hsdp"
      version = ">= 0.6.7"
    }
  }
}
