resource "kubernetes_ingress" "example-ingress" {
  metadata {
    name = "example-ingress"
    namespace = kubernetes_namespace.events_ns.metadata[0].name
  }

  spec {
    rule {
      http {
        path {
          backend {
            service_name = "events-external-service"
            service_port = 80
          }

          path = "/*"
        }

        path {
          backend {
            service_name = "events-internal-service"
            service_port = 80
          }

          path = "/json/*"
        }
      }
        }
  }
      
}