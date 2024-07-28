# Terraform DNS Module

This Terraform module allows you to easily provision and manage DNS resources in your infrastructure.

## Features

- Create and manage DNS zones
- Provision DNS records for various record types (A, CNAME, MX, etc.)
- Support for DNS zone delegation
- Easy configuration using variables

## Usage

```hcl
module "dns" {
    source = "git::https://github.com/your-organization/terraform-dns-module.git"

    zone_name = "example.com"

    records = [
        {
            name    = "www"
            type    = "A"
            value   = "192.168.1.1"
            ttl     = 300
        },
        {
            name    = "mail"
            type    = "MX"
            value   = "mail.example.com"
            priority = 10
            ttl     = 3600
        },
        {
            name    = "blog"
            type    = "CNAME"
            value   = "www.example.com"
            ttl     = 1800
        }
    ]
}
```

## Variables

| Name       | Description                  | Type   | Default |
|------------|------------------------------|--------|---------|
| zone_name  | The name of the DNS zone     | string |         |
| records    | List of DNS records to create | list   | []      |

## Outputs

| Name       | Description                  |
|------------|------------------------------|
| zone_id    | The ID of the DNS zone       |
| records    | List of created DNS records  |

## License

This module is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
