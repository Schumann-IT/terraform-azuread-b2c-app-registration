output "admin_consent_required" {
  description = "Whether admin consent is required."
  value       = length(var.config.required_resource_access) > 0
}

output "application_id" {
  description = "The application (client) ID of the application."
  value       = azuread_application.this.client_id
}

output "display_name" {
  description = "The display name of the application."
  value       = azuread_application.this.display_name
}

output "exposed_api_permissions" {
  description = "The exposed API permissions of the application."
  value = {
    (azuread_application.this.client_id) = [
      for p in azuread_application_permission_scope.this : p.scope_id
    ]
  }
}

output "object_id" {
  description = "The object ID of the application."
  value       = azuread_application.this.object_id
}
