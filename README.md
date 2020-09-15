# Kafka on HSDP
This Terraform root module demonstrates usage of a Kafka Cluster provisioned 
Container Host. We also spin up a Kafdrop instance as an example app hosted
on Cloud foundry

## Requirements

| Name | Version |
|------|---------|
| cloudfoundry | >= 0.12.4 |
| hsdp | >= 0.6.1 |

## Providers

| Name | Version |
|------|---------|
| cloudfoundry | >= 0.12.4 |

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

## Outputs

No output.

# Contact / Getting help

andy.lo-a-foe@philips.com

# License

License is MIT
