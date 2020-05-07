resource "kubernetes_deployment" "events-internal-deployment" {
  metadata {
    name = "events-internal-deployment"
    labels = {
      App = "events-internal"
    }
    namespace = kubernetes_namespace.events_ns.metadata[0].name
  }

  spec {
    replicas                  = 2
    progress_deadline_seconds = 60
    selector {
      match_labels = {
        App = "events-internal"
      }
    }
    template {
      metadata {
        labels = {
          App = "events-internal"
        }
      }
      spec {
        container {
          image = "${var.container_registry}/${var.project_id}/${var.internal_image_name}"
          name  = "events-internal"

          port {
            container_port = 8080
          }

          resources {
            limits {
              cpu    = "0.2"
              memory = "256Mi"
            }
          }
        }
      }
    }
  }
}