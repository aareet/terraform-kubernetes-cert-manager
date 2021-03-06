resource "kubernetes_manifest" "clusterrolebinding_cert_manager_controller_orders" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRoleBinding"
    "metadata" = {
      "labels" = {
        "app" = "cert-manager"
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "cert-manager"
      }
      "name" = "cert-manager-controller-orders"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "ClusterRole"
      "name" = "cert-manager-controller-orders"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "cert-manager"
        "namespace" = kubernetes_manifest.namespace_cert_manager.object.metadata.name
      },
    ]
  }
}
