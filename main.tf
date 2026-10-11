resource "google_compute_managed_ssl_certificate" "compute_managed_ssl_certificates" {
  for_each = var.compute_managed_ssl_certificates

  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  name            = each.value.name
  project         = each.value.project
  type            = each.value.type

  dynamic "managed" {
    for_each = each.value.managed != null ? [each.value.managed] : []
    content {
      domains = managed.value.domains
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}

