resource "kubernetes_manifest" "clusterrole_cert_manager_view" {
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
        "rbac.authorization.k8s.io/aggregate-to-admin" = "true"
        "rbac.authorization.k8s.io/aggregate-to-edit" = "true"
        "rbac.authorization.k8s.io/aggregate-to-view" = "true"
      }
      "name" = "cert-manager-view"
    }
    "rules" = [
      {
        "apiGroups" = [
          "cert-manager.io",
        ]
        "resources" = [
          "certificates",
          "certificaterequests",
          "issuers",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "acme.cert-manager.io",
        ]
        "resources" = [
          "challenges",
          "orders",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
    ]
  }
}
