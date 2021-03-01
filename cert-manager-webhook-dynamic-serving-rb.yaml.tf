resource "kubernetes_manifest" "rolebinding_cert_manager_webhook_dynamic_serving" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "RoleBinding"
    "metadata" = {
      "labels" = {
        "app" = "webhook"
        "app.kubernetes.io/component" = "webhook"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "webhook"
      }
      "name" = "cert-manager-webhook:dynamic-serving"
      "namespace" = "cert-manager"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "Role"
      "name" = "cert-manager-webhook:dynamic-serving"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "cert-manager-webhook"
        "namespace" = "cert-manager"
      },
    ]
  }
}
