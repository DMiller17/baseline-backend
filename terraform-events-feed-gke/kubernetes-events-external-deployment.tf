resource "kubernetes_deployment" "events-external-deployment" {
  metadata {
    name = "events-external-deployment"
    labels = {
      App = "events-external"
    }
    namespace = kubernetes_namespace.events_ns.metadata[0].name
  }

  spec {
    replicas                  = 2
    progress_deadline_seconds = 90
    selector {
      match_labels = {
        App = "events-external"
      }
    }
    template {
      metadata {
        labels = {
          App = "events-external"
        }
      }
      spec {
        container {
          image = "${var.container_registry}/${var.project_id}/${var.external_image_name}"
          name  = "events-external"

  
          port {
            container_port = 80
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