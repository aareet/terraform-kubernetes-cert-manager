resource "kubernetes_manifest" "clusterrole_cert_manager_controller_certificates" {
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
      "name" = "cert-manager-controller-certificates"
    }
    "rules" = [
      {
        "apiGroups" = [
          "cert-manager.io",
        ]
        "resources" = [
          "certificates",
          "certificates/status",
          "certificaterequests",
          "certificaterequests/status",
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
          "certificates",
          "certificaterequests",
          "clusterissuers",
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
          "cert-manager.io",
        ]
        "resources" = [
          "certificates/finalizers",
          "certificaterequests/finalizers",
        ]
        "verbs" = [
          "update",
        ]
      },
      {
        "apiGroups" = [
          "acme.cert-manager.io",
        ]
        "resources" = [
          "orders",
        ]
        "verbs" = [
          "create",
          "delete",
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
