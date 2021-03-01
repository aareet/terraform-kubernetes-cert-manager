resource "kubernetes_manifest" "customresourcedefinition_orders_acme_cert_manager_io" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "cert-manager.io/inject-ca-from-secret" = "cert-manager/cert-manager-webhook-ca"
      }
      "labels" = {
        "app" = "cert-manager"
        "app.kubernetes.io/instance" = "cert-manager"
        "app.kubernetes.io/name" = "cert-manager"
      }
      "name" = "orders.acme.cert-manager.io"
    }
    "spec" = {
      "conversion" = {
        "strategy" = "Webhook"
        "webhook" = {
          "clientConfig" = {
            "service" = {
              "name" = "cert-manager-webhook"
              "namespace" = "cert-manager"
              "path" = "/convert"
            }
          }
          "conversionReviewVersions" = [
            "v1",
            "v1beta1",
          ]
        }
      }
      "group" = "acme.cert-manager.io"
      "names" = {
        "categories" = [
          "cert-manager",
          "cert-manager-acme",
        ]
        "kind" = "Order"
        "listKind" = "OrderList"
        "plural" = "orders"
        "singular" = "order"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "additionalPrinterColumns" = [
            {
              "jsonPath" = ".status.state"
              "name" = "State"
              "type" = "string"
            },
            {
              "jsonPath" = ".spec.issuerRef.name"
              "name" = "Issuer"
              "priority" = 1
              "type" = "string"
            },
            {
              "jsonPath" = ".status.reason"
              "name" = "Reason"
              "priority" = 1
              "type" = "string"
            },
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC."
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1alpha2"
          "schema" = {
            "openAPIV3Schema" = {
              "description" = "Order is a type to represent an Order with an ACME server"
              "properties" = {
                "apiVersion" = {
                  "description" = "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
                  "type" = "string"
                }
                "kind" = {
                  "description" = "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
                  "type" = "string"
                }
                "metadata" = {
                  "type" = "object"
                }
                "spec" = {
                  "properties" = {
                    "commonName" = {
                      "description" = "CommonName is the common name as specified on the DER encoded CSR. If specified, this value must also be present in `dnsNames` or `ipAddresses`. This field must match the corresponding field on the DER encoded CSR."
                      "type" = "string"
                    }
                    "csr" = {
                      "description" = "Certificate signing request bytes in DER encoding. This will be used when finalizing the order. This field must be set on the order."
                      "format" = "byte"
                      "type" = "string"
                    }
                    "dnsNames" = {
                      "description" = "DNSNames is a list of DNS names that should be included as part of the Order validation process. This field must match the corresponding field on the DER encoded CSR."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "duration" = {
                      "description" = "Duration is the duration for the not after date for the requested certificate. this is set on order creation as pe the ACME spec."
                      "type" = "string"
                    }
                    "ipAddresses" = {
                      "description" = "IPAddresses is a list of IP addresses that should be included as part of the Order validation process. This field must match the corresponding field on the DER encoded CSR."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "issuerRef" = {
                      "description" = "IssuerRef references a properly configured ACME-type Issuer which should be used to create this Order. If the Issuer does not exist, processing will be retried. If the Issuer is not an 'ACME' Issuer, an error will be returned and the Order will be marked as failed."
                      "properties" = {
                        "group" = {
                          "description" = "Group of the resource being referred to."
                          "type" = "string"
                        }
                        "kind" = {
                          "description" = "Kind of the resource being referred to."
                          "type" = "string"
                        }
                        "name" = {
                          "description" = "Name of the resource being referred to."
                          "type" = "string"
                        }
                      }
                      "required" = [
                        "name",
                      ]
                      "type" = "object"
                    }
                  }
                  "required" = [
                    "csr",
                    "issuerRef",
                  ]
                  "type" = "object"
                }
                
              }
              "required" = [
                "metadata",
              ]
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
          }
        },
        {
          "additionalPrinterColumns" = [
            {
              "jsonPath" = ".status.state"
              "name" = "State"
              "type" = "string"
            },
            {
              "jsonPath" = ".spec.issuerRef.name"
              "name" = "Issuer"
              "priority" = 1
              "type" = "string"
            },
            {
              "jsonPath" = ".status.reason"
              "name" = "Reason"
              "priority" = 1
              "type" = "string"
            },
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC."
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1alpha3"
          "schema" = {
            "openAPIV3Schema" = {
              "description" = "Order is a type to represent an Order with an ACME server"
              "properties" = {
                "apiVersion" = {
                  "description" = "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
                  "type" = "string"
                }
                "kind" = {
                  "description" = "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
                  "type" = "string"
                }
                "metadata" = {
                  "type" = "object"
                }
                "spec" = {
                  "properties" = {
                    "commonName" = {
                      "description" = "CommonName is the common name as specified on the DER encoded CSR. If specified, this value must also be present in `dnsNames` or `ipAddresses`. This field must match the corresponding field on the DER encoded CSR."
                      "type" = "string"
                    }
                    "csr" = {
                      "description" = "Certificate signing request bytes in DER encoding. This will be used when finalizing the order. This field must be set on the order."
                      "format" = "byte"
                      "type" = "string"
                    }
                    "dnsNames" = {
                      "description" = "DNSNames is a list of DNS names that should be included as part of the Order validation process. This field must match the corresponding field on the DER encoded CSR."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "duration" = {
                      "description" = "Duration is the duration for the not after date for the requested certificate. this is set on order creation as pe the ACME spec."
                      "type" = "string"
                    }
                    "ipAddresses" = {
                      "description" = "IPAddresses is a list of IP addresses that should be included as part of the Order validation process. This field must match the corresponding field on the DER encoded CSR."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "issuerRef" = {
                      "description" = "IssuerRef references a properly configured ACME-type Issuer which should be used to create this Order. If the Issuer does not exist, processing will be retried. If the Issuer is not an 'ACME' Issuer, an error will be returned and the Order will be marked as failed."
                      "properties" = {
                        "group" = {
                          "description" = "Group of the resource being referred to."
                          "type" = "string"
                        }
                        "kind" = {
                          "description" = "Kind of the resource being referred to."
                          "type" = "string"
                        }
                        "name" = {
                          "description" = "Name of the resource being referred to."
                          "type" = "string"
                        }
                      }
                      "required" = [
                        "name",
                      ]
                      "type" = "object"
                    }
                  }
                  "required" = [
                    "csr",
                    "issuerRef",
                  ]
                  "type" = "object"
                }
                
              }
              "required" = [
                "metadata",
              ]
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
          }
        },
        {
          "additionalPrinterColumns" = [
            {
              "jsonPath" = ".status.state"
              "name" = "State"
              "type" = "string"
            },
            {
              "jsonPath" = ".spec.issuerRef.name"
              "name" = "Issuer"
              "priority" = 1
              "type" = "string"
            },
            {
              "jsonPath" = ".status.reason"
              "name" = "Reason"
              "priority" = 1
              "type" = "string"
            },
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC."
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "description" = "Order is a type to represent an Order with an ACME server"
              "properties" = {
                "apiVersion" = {
                  "description" = "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
                  "type" = "string"
                }
                "kind" = {
                  "description" = "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
                  "type" = "string"
                }
                "metadata" = {
                  "type" = "object"
                }
                "spec" = {
                  "properties" = {
                    "commonName" = {
                      "description" = "CommonName is the common name as specified on the DER encoded CSR. If specified, this value must also be present in `dnsNames` or `ipAddresses`. This field must match the corresponding field on the DER encoded CSR."
                      "type" = "string"
                    }
                    "dnsNames" = {
                      "description" = "DNSNames is a list of DNS names that should be included as part of the Order validation process. This field must match the corresponding field on the DER encoded CSR."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "duration" = {
                      "description" = "Duration is the duration for the not after date for the requested certificate. this is set on order creation as pe the ACME spec."
                      "type" = "string"
                    }
                    "ipAddresses" = {
                      "description" = "IPAddresses is a list of IP addresses that should be included as part of the Order validation process. This field must match the corresponding field on the DER encoded CSR."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "issuerRef" = {
                      "description" = "IssuerRef references a properly configured ACME-type Issuer which should be used to create this Order. If the Issuer does not exist, processing will be retried. If the Issuer is not an 'ACME' Issuer, an error will be returned and the Order will be marked as failed."
                      "properties" = {
                        "group" = {
                          "description" = "Group of the resource being referred to."
                          "type" = "string"
                        }
                        "kind" = {
                          "description" = "Kind of the resource being referred to."
                          "type" = "string"
                        }
                        "name" = {
                          "description" = "Name of the resource being referred to."
                          "type" = "string"
                        }
                      }
                      "required" = [
                        "name",
                      ]
                      "type" = "object"
                    }
                    "request" = {
                      "description" = "Certificate signing request bytes in DER encoding. This will be used when finalizing the order. This field must be set on the order."
                      "format" = "byte"
                      "type" = "string"
                    }
                  }
                  "required" = [
                    "issuerRef",
                    "request",
                  ]
                  "type" = "object"
                }
                
              }
              "required" = [
                "metadata",
                "spec",
              ]
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
          }
        },
        {
          "additionalPrinterColumns" = [
            {
              "jsonPath" = ".status.state"
              "name" = "State"
              "type" = "string"
            },
            {
              "jsonPath" = ".spec.issuerRef.name"
              "name" = "Issuer"
              "priority" = 1
              "type" = "string"
            },
            {
              "jsonPath" = ".status.reason"
              "name" = "Reason"
              "priority" = 1
              "type" = "string"
            },
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC."
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1"
          "schema" = {
            "openAPIV3Schema" = {
              "description" = "Order is a type to represent an Order with an ACME server"
              "properties" = {
                "apiVersion" = {
                  "description" = "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
                  "type" = "string"
                }
                "kind" = {
                  "description" = "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
                  "type" = "string"
                }
                "metadata" = {
                  "type" = "object"
                }
                "spec" = {
                  "properties" = {
                    "commonName" = {
                      "description" = "CommonName is the common name as specified on the DER encoded CSR. If specified, this value must also be present in `dnsNames` or `ipAddresses`. This field must match the corresponding field on the DER encoded CSR."
                      "type" = "string"
                    }
                    "dnsNames" = {
                      "description" = "DNSNames is a list of DNS names that should be included as part of the Order validation process. This field must match the corresponding field on the DER encoded CSR."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "duration" = {
                      "description" = "Duration is the duration for the not after date for the requested certificate. this is set on order creation as pe the ACME spec."
                      "type" = "string"
                    }
                    "ipAddresses" = {
                      "description" = "IPAddresses is a list of IP addresses that should be included as part of the Order validation process. This field must match the corresponding field on the DER encoded CSR."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "issuerRef" = {
                      "description" = "IssuerRef references a properly configured ACME-type Issuer which should be used to create this Order. If the Issuer does not exist, processing will be retried. If the Issuer is not an 'ACME' Issuer, an error will be returned and the Order will be marked as failed."
                      "properties" = {
                        "group" = {
                          "description" = "Group of the resource being referred to."
                          "type" = "string"
                        }
                        "kind" = {
                          "description" = "Kind of the resource being referred to."
                          "type" = "string"
                        }
                        "name" = {
                          "description" = "Name of the resource being referred to."
                          "type" = "string"
                        }
                      }
                      "required" = [
                        "name",
                      ]
                      "type" = "object"
                    }
                    "request" = {
                      "description" = "Certificate signing request bytes in DER encoding. This will be used when finalizing the order. This field must be set on the order."
                      "format" = "byte"
                      "type" = "string"
                    }
                  }
                  "required" = [
                    "issuerRef",
                    "request",
                  ]
                  "type" = "object"
                }
                
              }
              "required" = [
                "metadata",
                "spec",
              ]
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
          }
        },
      ]
    }
    
  }
}
