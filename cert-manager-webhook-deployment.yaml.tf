resource "kubernetes_manifest" "deployment_cert_manager_webhook" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "webhook"
        "app.kubernetes.io/component" = "webhook"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "webhook"
      }
      "name" = "cert-manager-webhook"
      "namespace" = "cert-manager"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app.kubernetes.io/component" = "webhook"
          "app.kubernetes.io/instance" = "cert-manager"
          "app.kubernetes.io/name" = "webhook"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "webhook"
            "app.kubernetes.io/component" = "webhook"
            "app.kubernetes.io/instance" = "cert-manager"
            "app.kubernetes.io/name" = "webhook"
          }
        }
        "spec" = {
          "containers" = [
            {
              "args" = [
                "--v=2",
                "--secure-port=10250",
                "--dynamic-serving-ca-secret-namespace=$(POD_NAMESPACE)",
                "--dynamic-serving-ca-secret-name=cert-manager-webhook-ca",
                "--dynamic-serving-dns-names=cert-manager-webhook,cert-manager-webhook.cert-manager,cert-manager-webhook.cert-manager.svc",
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
              "image" = "quay.io/jetstack/cert-manager-webhook:v1.2.0"
              "imagePullPolicy" = "IfNotPresent"
              "livenessProbe" = {
                "failureThreshold" = 3
                "httpGet" = {
                  "path" = "/livez"
                  "port" = 6080
                  "scheme" = "HTTP"
                }
                "initialDelaySeconds" = 60
                "periodSeconds" = 10
                "successThreshold" = 1
                "timeoutSeconds" = 1
              }
              "name" = "cert-manager"
              "ports" = [
                {
		  "protocol" = "TCP"
                  "containerPort" = 10250
                  "name" = "https"
                },
              ]
              "readinessProbe" = {
                "failureThreshold" = 3
                "httpGet" = {
                  "path" = "/healthz"
                  "port" = 6080
                  "scheme" = "HTTP"
                }
                "initialDelaySeconds" = 5
                "periodSeconds" = 5
                "successThreshold" = 1
                "timeoutSeconds" = 1
              }
              "resources" = {}
            },
          ]
          "serviceAccountName" = "cert-manager-webhook"
        }
      }
    }
  }
}
