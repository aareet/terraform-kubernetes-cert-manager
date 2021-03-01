resource "kubernetes_manifest" "serviceaccount_cert_manager_webhook" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind" = "ServiceAccount"
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
  }
}
