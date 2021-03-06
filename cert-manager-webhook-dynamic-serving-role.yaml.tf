resource "kubernetes_manifest" "role_cert_manager_webhook_dynamic_serving" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "Role"
    "metadata" = {
      "labels" = {
        "app" = "webhook"
        "app.kubernetes.io/component" = "webhook"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "webhook"
      }
      "name" = "cert-manager-webhook:dynamic-serving"
      "namespace" = kubernetes_manifest.namespace_cert_manager.object.metadata.name
    }
    "rules" = [
      {
        "apiGroups" = [
          "",
        ]
        "resourceNames" = [
          "cert-manager-webhook-ca",
        ]
        "resources" = [
          "secrets",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
          "update",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "secrets",
        ]
        "verbs" = [
          "create",
        ]
      },
    ]
  }
}
