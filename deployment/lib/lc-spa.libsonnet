{
  _config+:: {
    lcspa: {
      name: error '$._config.lcspa.name must be defined',
      image: error '$._config.lcspa.image must be defined',
      host: 'REPLACEME.internal.cloudflight.dev',
      replicas: 2
    },
  },
  lcspa: {
    deployment: {
      "apiVersion": "apps/v1",
      "kind": "Deployment",
      "metadata": {
        "name": $._config.lcspa.name,
        "namespace": "lancrypt"
      },
      "spec": {
        "replicas": $._config.lcspa.replicas,
         "selector": {
            "matchLabels": {
              "app.kubernetes.io/instance": $._config.lcspa.name,
              "app.kubernetes.io/name": $._config.lcspa.name
            }
        },
        "template": {
          "metadata": {
            "labels": {
              "app.kubernetes.io/instance": $._config.lcspa.name,
              "app.kubernetes.io/name": $._config.lcspa.name
            }
          },
          "spec": {
            "containers": [
              {
                "image": $._config.lcspa.image,
                "volumeMounts": [
                  {
                    "name": "environment-config",
                    "mountPath": "/usr/share/nginx/html/assets/config",
                    "readOnly": true
                  }
                ],
                "imagePullPolicy": "Always",
                "livenessProbe": {
                  "failureThreshold": 3,
                  "httpGet": {
                    "path": "/",
                    "port": "http",
                    "scheme": "HTTP"
                  },
                  "periodSeconds": 10,
                  "successThreshold": 1,
                  "timeoutSeconds": 1
                },
                "name": $._config.lcspa.name,
                "ports": [
                  {
                    "containerPort": 80,
                    "name": "http",
                    "protocol": "TCP"
                  }
                ],
                "readinessProbe": {
                  "failureThreshold": 3,
                  "httpGet": {
                    "path": "/",
                    "port": "http",
                    "scheme": "HTTP"
                  },
                  "periodSeconds": 10,
                  "successThreshold": 1,
                  "timeoutSeconds": 1
                },
                "resources": {
                  "limits": {
                    "cpu": "25m",
                    "memory": "32Mi"
                  },
                  "requests": {
                    "cpu": "25m",
                    "memory": "32Mi"
                  }
                },
                "securityContext": {},
                "terminationMessagePath": "/dev/termination-log",
                "terminationMessagePolicy": "File"
              }
            ],
            "imagePullSecrets": [
              {
                "name": "docker-registry-credentials"
              }
            ],
            "volumes": [
              {
                "name": "environment-config",
                "configMap": {
                  "name": $._config.lcspa.name
                }
              }
            ],
            "dnsPolicy": "ClusterFirst",
            "restartPolicy": "Always",
            "schedulerName": "default-scheduler",
            "securityContext": {},
            "terminationGracePeriodSeconds": 30
          }
        }
      }
    },
    service: {
      
      "apiVersion": "v1",
      "kind": "Service",
      "metadata": {
        "name": $._config.lcspa.name,
        "namespace": "lancrypt"
      },
      "spec": {
        "ports": [
          {
            "name": "http",
            "port": 80,
            "protocol": "TCP",
            "targetPort": "http"
          }
        ],
        "selector": {
          "app.kubernetes.io/instance": $._config.lcspa.name,
          "app.kubernetes.io/name": $._config.lcspa.name
        },
        "sessionAffinity": "None",
        "type": "ClusterIP"
      }

    },
    ingress: {
          
      "apiVersion": "networking.k8s.io/v1",
      "kind": "Ingress",
      "metadata": {
        "annotations": {
          "kubernetes.io/ingress.class": "nginx",
          "nginx.ingress.kubernetes.io/ssl-redirect": "true",
          "cert-manager.io/cluster-issuer": "letsencrypt",
          "nginx.ingress.kubernetes.io/whitelist-source-range": "185.225.96.3/32, 185.225.96.4/31, 185.225.96.6/32, 185.225.96.35/32, 185.225.96.36/31, 185.225.96.38/32, 185.225.98.7/32, 185.225.96.195/32, 185.225.96.196/31, 5.2.197.133/32, 217.110.241.10/32, 185.89.162.202/32, 82.218.187.242/32, 185.225.97.90/31, 185.225.97.92/30, 185.225.97.96/30, 84.115.236.147/32, 83.215.177.113/32, 178.115.34.231/32, 5.10.165.186/32, 5.10.165.187/32, 5.10.165.188/32, 5.10.165.189/32, 5.10.165.190/32, 185.194.65.206/32, 83.164.155.114/32"                                              
        },
        "name": $._config.lcspa.name,
        "namespace": "lancrypt"
      },
      "spec": {
        "rules": [
          {
            "host": $._config.lcspa.host,
            "http": {
              "paths": [
                {
                  "backend": {
                    "service": {
                      "name": $._config.lcspa.name,
                      "port": {
                        "number": 80
                      }
                    }
                  },
                  "path": "/",
                  "pathType": "ImplementationSpecific"
                }
              ]
            }
          }
        ],
        "tls": [
          {
            "hosts": [
              $._config.lcspa.host
            ],
            "secretName": $._config.lcspa.name
          }
        ]
      }
    },
    configMap: {
      "apiVersion": "v1",
      "data": {
        "config.js": "const environment = {\n  production: "+$._config.lcspa.productionMode+",\n  keycloak: {\n    host: \""+$._config.lcspa.keycloak.host+"\",\n    realm: \""+$._config.lcspa.keycloak.realm+"\",\n    clientId: \""+$._config.lcspa.keycloak.clientId+"\",\n    redirectUrl: \""+$._config.lcspa.keycloak.redirectUrl+"\"\n  },\n  recaptcha: {\n    siteKey: \""+$._config.lcspa.recaptchaKey+"\"\n  },\n  backends: {\n    portalFeCmpBaseUrl: \""+$._config.lcspa.portalFeCmpBaseUrl+"\"\n  }\n};\n(function (window) {\n  window[\"env\"] = window[\"env\"] || {};\n\n  window[\"env\"] = environment;\n})(this);\n",
      },
      "kind": "ConfigMap",
      "metadata": {
        "name": $._config.lcspa.name,
        "namespace": "lancrypt"
      }
    }
  }
}