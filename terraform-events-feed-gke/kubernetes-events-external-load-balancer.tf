resource "kubernetes_service" "events-external-service" {
  metadata {
    name      = "events-external-service"
    namespace = kubernetes_namespace.events_ns.metadata[0].name
  }
  spec {
    selector = {
      App = kubernetes_deployment.events-external-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

