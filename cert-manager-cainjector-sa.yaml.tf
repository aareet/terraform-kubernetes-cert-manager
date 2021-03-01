resource "kubernetes_manifest" "serviceaccount_cert_manager_cainjector" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "v1"
    "kind" = "ServiceAccount"
    "metadata" = {
      "labels" = {
        "app" = "cainjector"
        "app.kubernetes.io/component" = "cainjector"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "cainjector"
      }
      "name" = "cert-manager-cainjector"
      "namespace" = kubernetes_manifest.namespace_cert_manager.object.metadata.name
    }
  }
}
