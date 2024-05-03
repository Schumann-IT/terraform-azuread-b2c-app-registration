# terraform-azuread-b2c-app-registration

This module manages the configuration of an app-registration for Azure AD B2C directory.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.0, < 2.0.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.38.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0.0, < 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | >= 2.38.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0.0, < 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_identifier_uri.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_identifier_uri) | resource |
| [azuread_application_permission_scope.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_permission_scope) | resource |
| [random_uuid.permission_scopes](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |
| [azuread_application.this](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/application) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | The application config. | <pre>object({<br>    display_name                   = optional(string, null)<br>    fallback_public_client_enabled = optional(bool, false)<br>    sign_in_audience               = optional(string, "AzureADMyOrg")<br>    api = object({<br>      known_client_applications      = optional(list(string), [])<br>      mapped_claims_enabled          = optional(bool, false)<br>      requested_access_token_version = number<br>    })<br>    web = optional(object({<br>      enabled                       = optional(bool, false)<br>      redirect_uris                 = optional(list(string), [])<br>      logout_url                    = optional(string, null)<br>      access_token_issuance_enabled = optional(bool, false)<br>      id_token_issuance_enabled     = optional(bool, false)<br>    }), { enabled = false })<br>    public_client = optional(object({<br>      enabled       = optional(bool, false)<br>      redirect_uris = optional(list(string), [])<br>    }), { enabled = false })<br>    required_graph_api_permissions = optional(list(string), [])<br>    identifier_uri                 = optional(string, "")<br>    domain_name                    = optional(string, "")<br>    permission_scopes = optional(list(object({<br>      name                       = string<br>      consent_type               = optional(string, "Admin")<br>      admin_consent_description  = string<br>      admin_consent_display_name = string<br>    })), [])<br>    required_resource_access = optional(map(list(string)), {})<br>  })</pre> | n/a | yes |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the application. If set to false, the application must exist and specified with var.object\_id. | `bool` | `false` | no |
| <a name="input_object_id"></a> [object\_id](#input\_object\_id) | The object id of the application. If create is set to false, this must be specified. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_consent_required"></a> [admin\_consent\_required](#output\_admin\_consent\_required) | Whether admin consent is required. |
| <a name="output_application_id"></a> [application\_id](#output\_application\_id) | The application (client) ID of the application. |
| <a name="output_display_name"></a> [display\_name](#output\_display\_name) | The display name of the application. |
| <a name="output_exposed_api_permissions"></a> [exposed\_api\_permissions](#output\_exposed\_api\_permissions) | The exposed API permissions of the application. |
| <a name="output_object_id"></a> [object\_id](#output\_object\_id) | The object ID of the application. |
<!-- END_TF_DOCS -->
