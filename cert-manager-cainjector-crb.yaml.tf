resource "kubernetes_manifest" "clusterrolebinding_cert_manager_cainjector" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRoleBinding"
    "metadata" = {
      "labels" = {
        "app" = "cainjector"
        "app.kubernetes.io/component" = "cainjector"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "cainjector"
      }
      "name" = "cert-manager-cainjector"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "ClusterRole"
      "name" = "cert-manager-cainjector"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "cert-manager-cainjector"
        "namespace" = "cert-manager"
      },
    ]
  }
}