resource "kubernetes_manifest" "clusterrole_cert_manager_controller_clusterissuers" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRole"
    "metadata" = {
      "labels" = {
        "app" = "cert-manager"
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "cert-manager"
      }
      "name" = "cert-manager-controller-clusterissuers"
    }
    "rules" = [
      {
        "apiGroups" = [
          "cert-manager.io",
        ]
        "resources" = [
          "clusterissuers",
          "clusterissuers/status",
        ]
        "verbs" = [
          "update",
        ]
      },
      {
        "apiGroups" = [
          "cert-manager.io",
        ]
        "resources" = [
          "clusterissuers",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
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
          "get",
          "list",
          "watch",
          "create",
          "update",
          "delete",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "events",
        ]
        "verbs" = [
          "create",
          "patch",
        ]
      },
    ]
  }
}
