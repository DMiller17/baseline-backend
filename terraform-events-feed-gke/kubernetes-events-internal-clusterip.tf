resource "kubernetes_service" "events-internal-service" {
  metadata {
    name      = "events-internal-service"
    namespace = kubernetes_namespace.events_ns.metadata[0].name
  }
  spec {
    selector = {
      App = kubernetes_deployment.events-internal-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "NodePort"
  }
}
