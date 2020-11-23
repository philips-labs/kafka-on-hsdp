# Kafka on HSDP
This Terraform root module demonstrates usage of a Kafka Cluster provisioned 
Container Host. We also spin up a Kafdrop instance as an example app hosted
on Cloud foundry

>**NOTE**: authentication/authorization is mTLS-SSL. you will need to create you own certificates.

## Requirements

| Name | Version |
|------|---------|
| cloudfoundry | >= 0.1206.0 |
| hsdp | >= 0.7.0 |

## Providers

| Name | Version |
|------|---------|
| cloudfoundry | >= 0.1206.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bastion\_host | Bastion Host to use (region specific) | `string` | `"gw-eu1.phsdp.com"` | no |
| cartel\_host | Cartel API host (region specific) | `string` | `"cartel-eu1.cloud.phsdp.com"` | no |
| cartel\_secret | Cartel secret to use for Container Host | `string` | n/a | yes |
| cartel\_token | Cartel token to use for Container Host | `string` | n/a | yes |
| cf\_api | Cloud foundry API endpoint (region specific) | `string` | `"https://api.eu1.phsdp.com"` | no |
| cf\_domain | Default Cloud foundry domain to use for apps | `string` | `"eu-west.philips-healthsuite.com"` | no |
| cf\_org | Cloud foundry ORG name | `string` | n/a | yes |
| cf\_password | Cloud foundry password | `string` | n/a | yes |
| cf\_region | Cloud foundry region | `string` | `"eu-west"` | no |
| cf\_space | Cloud foundry space to provision Kafdrop in | `string` | n/a | yes |
| cf\_username | Cloud foundry username | `string` | n/a | yes |
| kafka\_instance\_type | The EC2 instance type to use for Kafka nodes | `string` | `"t3.large"` | no |
| kafka\_nodes | Number of Kafka nodes to spin up | `number` | `1` | no |
| name\_postfix | Optional postfix to append in routes | `string` | `""` | no |
| private\_key\_file | SSH private key. Used to access SSH bastion host | `string` | n/a | yes |
| zookeeper\_instance\_type | The EC2 instance type to use for Zookeeper servers | `string` | `"t2.medium"` | no |
| zookeeper\_nodes | Number of Zookeeper nodes to spin up | `number` | `1` | no |
| zoo\_trust\_store\_file | zookeeper trust store JKS format path | `string` | none | yes |
| kafka\_trust\_store\_file | kafka trust store JKS format path | `string` | none | yes |
| zoo\_key\_store\_file | zookeeper key store JKS format path | `string` | none | yes |
| kafka\_key\_store\_file | kafka key store JKS format path | `string` | none | yes |
| kafdrop\_key\_store\_file | kafdrop key store JKS format path | `string` | none | yes |
| kafka\_properties\_file | kafka properties file for kafdrop | `string` | none | yes |
| ssl\_pass | a single password that works with all key stores and all trust stores (yes this is an example) | `string` | none | yes |

## Outputs

No output.

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

andy.lo-a-foe@philips.com

# License

License is MIT
