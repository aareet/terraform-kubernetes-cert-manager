resource "kubernetes_manifest" "service_cert_manager" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app" = "cert-manager"
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "cert-manager"
      }
      "name" = "cert-manager"
      "namespace" = kubernetes_manifest.namespace_cert_manager.object.metadata.name
    }
    "spec" = {
      "ports" = [
        {
          "port" = 9402
          "protocol" = "TCP"
          "targetPort" = 9402
        },
      ]
      "selector" = {
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "cert-manager"
      }
      "type" = "ClusterIP"
    }
  }
}
