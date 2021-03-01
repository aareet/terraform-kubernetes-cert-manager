resource "kubernetes_manifest" "deployment_cert_manager" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "cert-manager"
        "app.kubernetes.io/component" = "controller"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "cert-manager"
      }
      "name" = "cert-manager"
      "namespace" = kubernetes_manifest.namespace_cert_manager.object.metadata.name
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app.kubernetes.io/component" = "controller"
          "app.kubernetes.io/instance" = "cert-manager"
          "app.kubernetes.io/name" = "cert-manager"
        }
      }
      "template" = {
        "metadata" = {
          "annotations" = {
            "prometheus.io/path" = "/metrics"
            "prometheus.io/port" = "9402"
            "prometheus.io/scrape" = "true"
          }
          "labels" = {
            "app" = "cert-manager"
            "app.kubernetes.io/component" = "controller"
            "app.kubernetes.io/instance" = "cert-manager"
            "app.kubernetes.io/name" = "cert-manager"
          }
        }
        "spec" = {
          "containers" = [
            {
              "args" = [
                "--v=2",
                "--cluster-resource-namespace=$(POD_NAMESPACE)",
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
              "image" = "quay.io/jetstack/cert-manager-controller:v1.2.0"
              "imagePullPolicy" = "IfNotPresent"
              "name" = "cert-manager"
              "ports" = [
                {
                  "containerPort" = 9402
                  "protocol" = "TCP"
                },
              ]
              "resources" = {}
            },
          ]
          "serviceAccountName" = "cert-manager"
        }
      }
    }
  }
}
