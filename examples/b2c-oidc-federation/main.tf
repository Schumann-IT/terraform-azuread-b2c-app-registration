terraform {
  required_version = ">= 1.4.0, < 2.0.0"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.38.0"
    }
  }
}

provider "azuread" {}

module "app" {
  source = "../../"

  create = true
  config = {
    sign_in_audience = "AzureADandPersonalMicrosoftAccount"
    api = {
      requested_access_token_version = 2
    }
    web = {
      enabled       = true
      redirect_uris = ["http://localhost:8080/"]
    }
    public_client = {
      enabled = false
    }
    required_graph_api_permissions = [
      "37f7f235-527c-4136-accd-4a02d197296e", # https://learn.microsoft.com/en-us/graph/permissions-reference#openid
      "7427e0e9-2fba-42fe-b0c0-848c9e6a8182"  # https://learn.microsoft.com/en-us/graph/permissions-reference#offline_access
    ]
    domain_name = "example.onmicrosoft.com"
  }
}