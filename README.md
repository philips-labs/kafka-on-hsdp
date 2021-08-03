# Kafka on HSDP
This Terraform root module demonstrates usage of a Kafka Cluster provisioned 
Container Host. We also spin up a Kafdrop instance as an example app hosted
on Cloud foundry

>**NOTE**: authentication/authorization is mTLS-SSL. you will need to create you own certificates.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudfoundry"></a> [cloudfoundry](#requirement\_cloudfoundry) | >= 0.14.2 |
| <a name="requirement_hsdp"></a> [hsdp](#requirement\_hsdp) | >= 0.18.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudfoundry"></a> [cloudfoundry](#provider\_cloudfoundry) | >= 0.14.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kafka"></a> [kafka](#module\_kafka) | philips-labs/kafka/hsdp | 0.8.0 |
| <a name="module_zookeeper"></a> [zookeeper](#module\_zookeeper) | philips-labs/zookeeper/hsdp | 0.8.0 |

## Resources

| Name | Type |
|------|------|
| [cloudfoundry_app.kafdrop](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/app) | resource |
| [cloudfoundry_route.kafdrop](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/route) | resource |
| [cloudfoundry_domain.domain](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/domain) | data source |
| [cloudfoundry_org.org](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/org) | data source |
| [cloudfoundry_space.space](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/space) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bastion_host"></a> [bastion\_host](#input\_bastion\_host) | Bastion Host to use (region specific) | `string` | `"gw-eu1.phsdp.com"` | no |
| <a name="input_cartel_host"></a> [cartel\_host](#input\_cartel\_host) | Cartel API host (region specific) | `string` | n/a | yes |
| <a name="input_cartel_secret"></a> [cartel\_secret](#input\_cartel\_secret) | Cartel secret to use for Container Host | `string` | n/a | yes |
| <a name="input_cartel_token"></a> [cartel\_token](#input\_cartel\_token) | Cartel token to use for Container Host | `string` | n/a | yes |
| <a name="input_cf_api"></a> [cf\_api](#input\_cf\_api) | Cloud foundry API endpoint (region specific) | `string` | n/a | yes |
| <a name="input_cf_domain"></a> [cf\_domain](#input\_cf\_domain) | Default Cloud foundry domain to use for apps | `string` | n/a | yes |
| <a name="input_cf_org"></a> [cf\_org](#input\_cf\_org) | Cloud foundry ORG name | `string` | n/a | yes |
| <a name="input_cf_password"></a> [cf\_password](#input\_cf\_password) | Cloud foundry password | `string` | n/a | yes |
| <a name="input_cf_region"></a> [cf\_region](#input\_cf\_region) | Cloud foundry region | `string` | `"eu-west"` | no |
| <a name="input_cf_space"></a> [cf\_space](#input\_cf\_space) | Cloud foundry space to provision Kafdrop in | `string` | n/a | yes |
| <a name="input_cf_username"></a> [cf\_username](#input\_cf\_username) | Cloud foundry username | `string` | n/a | yes |
| <a name="input_kafdrop_key_store_file"></a> [kafdrop\_key\_store\_file](#input\_kafdrop\_key\_store\_file) | file path of the kafkadrop key store | `string` | n/a | yes |
| <a name="input_kafka_instance_type"></a> [kafka\_instance\_type](#input\_kafka\_instance\_type) | The EC2 instance type to use for Kafka nodes | `string` | `"t3.large"` | no |
| <a name="input_kafka_key_store_file"></a> [kafka\_key\_store\_file](#input\_kafka\_key\_store\_file) | file path of the kafka key store | `string` | n/a | yes |
| <a name="input_kafka_nodes"></a> [kafka\_nodes](#input\_kafka\_nodes) | Number of Kafka nodes to spin up | `number` | `1` | no |
| <a name="input_kafka_properties_file"></a> [kafka\_properties\_file](#input\_kafka\_properties\_file) | file path of the kafka properties file | `string` | n/a | yes |
| <a name="input_kafka_trust_store_file"></a> [kafka\_trust\_store\_file](#input\_kafka\_trust\_store\_file) | file path of the kafka trust store | `string` | n/a | yes |
| <a name="input_name_postfix"></a> [name\_postfix](#input\_name\_postfix) | Optional postfix to append in routes | `string` | `""` | no |
| <a name="input_private_key_file"></a> [private\_key\_file](#input\_private\_key\_file) | SSH private key. Used to access SSH bastion host | `string` | n/a | yes |
| <a name="input_ssl_pass"></a> [ssl\_pass](#input\_ssl\_pass) | one pass for all of the keys and stores | `string` | n/a | yes |
| <a name="input_zoo_key_store_file"></a> [zoo\_key\_store\_file](#input\_zoo\_key\_store\_file) | file path of the zookeeper key store | `string` | n/a | yes |
| <a name="input_zoo_trust_store_file"></a> [zoo\_trust\_store\_file](#input\_zoo\_trust\_store\_file) | file path of the zookeeper trust store | `string` | n/a | yes |
| <a name="input_zookeeper_instance_type"></a> [zookeeper\_instance\_type](#input\_zookeeper\_instance\_type) | The EC2 instance type to use for Zookeeper servers | `string` | `"t2.medium"` | no |
| <a name="input_zookeeper_nodes"></a> [zookeeper\_nodes](#input\_zookeeper\_nodes) | Number of Zookeeper nodes to spin up | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kafdrop_url"></a> [kafdrop\_url](#output\_kafdrop\_url) | n/a |

## key generation
Look at the (https://github.com/bitnami/bitnami-docker-kafka) for how to. there is a (https://raw.githubusercontent.com/confluentinc/confluent-platform-security-tools/master/kafka-generate-ssl.sh) which provides the necessary results.

## example kafka.properties file for kafdrop and possilby your clients
    
    kafka.securityprotocol=SSL
    ssl.security.protocol=SSL
    ssl.endpoint.identification.algorithm=
    ssl.truststore.password=<yourpass>
    ssl.truststore.type=JKS
    ssl.keystore.password=<yourpass>
    ssl.keystore.type=JKS
    ssl.key.password=<yourpass>

# Contact / Getting help

Post your question on the HSDP Slack `#terraform` channel

# License

License is MIT
