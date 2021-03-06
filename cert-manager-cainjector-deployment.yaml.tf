resource "kubernetes_manifest" "deployment_cert_manager_cainjector" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "cainjector"
        "app.kubernetes.io/component" = "cainjector"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "cainjector"
      }
      "name" = "cert-manager-cainjector"
      "namespace" = kubernetes_manifest.namespace_cert_manager.object.metadata.name
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app.kubernetes.io/component" = "cainjector"
          "app.kubernetes.io/instance" = "cert-manager"
          "app.kubernetes.io/name" = "cainjector"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "cainjector"
            "app.kubernetes.io/component" = "cainjector"
            "app.kubernetes.io/instance" = "cert-manager"
            "app.kubernetes.io/name" = "cainjector"
          }
        }
        "spec" = {
          "containers" = [
            {
              "args" = [
                "--v=2",
                "--leader-election-namespace=kube-system",
              ]
              "env" = [
                {
                  "name" = "POD_NAMESPACE"
                  "valueFrom" = {
                    "fieldRef" = {
                      "fieldPath" = "metadata.namespace"
                    }
                  }
                },
              ]
              "image" = "quay.io/jetstack/cert-manager-cainjector:v1.2.0"
              "imagePullPolicy" = "IfNotPresent"
              "name" = "cert-manager"
              "resources" = {}
            },
          ]
          "serviceAccountName" = "cert-manager-cainjector"
        }
      }
    }
  }
}
