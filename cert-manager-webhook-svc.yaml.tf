resource "kubernetes_manifest" "service_cert_manager_webhook" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app" = "webhook"
        "app.kubernetes.io/component" = "webhook"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "webhook"
      }
      "name" = "cert-manager-webhook"
      "namespace" = kubernetes_manifest.namespace_cert_manager.object.metadata.name
    }
    "spec" = {
      "ports" = [
        {
          "name" = "https"
          "port" = 443
          "targetPort" = 10250
	  "protocol" = "TCP"
        },
      ]
      "selector" = {
        "app.kubernetes.io/component" = "webhook"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "webhook"
      }
      "type" = "ClusterIP"
    }
  }
}
