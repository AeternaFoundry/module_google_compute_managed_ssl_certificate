variable "compute_managed_ssl_certificates" {
  description = <<EOT
Map of compute_managed_ssl_certificates, attributes below
Optional:
    - deletion_policy
    - description
    - name
    - project
    - type
    - managed (block):
        - domains (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
EOT

  type = map(object({
    deletion_policy = optional(string)
    description     = optional(string)
    name            = optional(string)
    project         = optional(string)
    type            = optional(string)
    managed = optional(object({
      domains = list(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

