resource "kubernetes_manifest" "clusterrole_cert_manager_edit" {
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
      }
      "name" = "cert-manager-edit"
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
          "create",
          "delete",
          "deletecollection",
          "patch",
          "update",
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
