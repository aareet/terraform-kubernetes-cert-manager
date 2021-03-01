resource "kubernetes_manifest" "clusterrole_cert_manager_controller_challenges" {
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
      "name" = "cert-manager-controller-challenges"
    }
    "rules" = [
      {
        "apiGroups" = [
          "acme.cert-manager.io",
        ]
        "resources" = [
          "challenges",
          "challenges/status",
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
          "challenges",
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
          "issuers",
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
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "pods",
          "services",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
          "create",
          "delete",
        ]
      },
      {
        "apiGroups" = [
          "networking.k8s.io",
        ]
        "resources" = [
          "ingresses",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
          "create",
          "delete",
          "update",
        ]
      },
      {
        "apiGroups" = [
          "route.openshift.io",
        ]
        "resources" = [
          "routes/custom-host",
        ]
        "verbs" = [
          "create",
        ]
      },
      {
        "apiGroups" = [
          "acme.cert-manager.io",
        ]
        "resources" = [
          "challenges/finalizers",
        ]
        "verbs" = [
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
          "get",
          "list",
          "watch",
        ]
      },
    ]
  }
}
