resource "kubernetes_manifest" "rolebinding_cert_manager_cainjector_leaderelection" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "RoleBinding"
    "metadata" = {
      "labels" = {
        "app" = "cainjector"
        "app.kubernetes.io/component" = "cainjector"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "cainjector"
      }
      "name" = "cert-manager-cainjector:leaderelection"
      "namespace" = "kube-system"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "Role"
      "name" = "cert-manager-cainjector:leaderelection"
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
