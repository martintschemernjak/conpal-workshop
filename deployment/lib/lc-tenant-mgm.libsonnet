local k = (import 'cloudflight-libsonnet/prelude.libsonnet');
{
  _config+:: {
    lctenantmgmcmp: {
      name: 'my-application',
      image: error '$._config.lctenantmgmcmp.image must be defined',
      replicas: 2,
      springProfile: error '$._config.lctenantmgmcmp.springProfile must be defined',
      dbCredentialsSecret: error '$._config.lctenantmgmcmp.dbCredentialsSecret must be defined',
      keycloakUserSecret: error '$._config.lctenantmgmcmp.keycloakUserSecret must be defined'
    },
  },
  lctenantmgmcmp: {
    deployment: {
      "apiVersion": "apps/v1",
      "kind": "Deployment",
      "metadata": {
        "labels": {
          "app.kubernetes.io/component": "backend",
          "app.kubernetes.io/name": $._config.lctenantmgmcmp.name
        },
        "name": $._config.lctenantmgmcmp.name,
        "namespace": "lancrypt"
      },
      "spec": {
        "minReadySeconds": 10,
        "progressDeadlineSeconds": 600,
        "replicas": $._config.lctenantmgmcmp.replicas,
        "revisionHistoryLimit": 10,
        "selector": {
          "matchLabels": {
            "name": $._config.lctenantmgmcmp.name
          }
        },
        "strategy": {
          "rollingUpdate": {
            "maxSurge": "25%",
            "maxUnavailable": "25%"
          },
          "type": "RollingUpdate"
        },
        "template": {
          "metadata": {
            "creationTimestamp": null,
            "labels": {
              "name": $._config.lctenantmgmcmp.name
            }
          },
          "spec": {
            "containers": [
              {
                "env": [
                  {
                    "name": "APPLICATIONINSIGHTS_CONNECTION_STRING",
                     "valueFrom": {
                        "secretKeyRef": {
                          "key": $._config.lctenantmgmcmp.name,
                          "name": "application-insights-connectionstrings"
                        }
                    }
                  },
                  {
                    "name": "SPRING_PROFILES_ACTIVE",
                    "value": $._config.lctenantmgmcmp.springProfile
                  },
                  {
                    "name": "LC_AUDITING_SHARED-JWT-SECRET",
                    "valueFrom": {
                        "secretKeyRef": {
                          "key": "key",
                          "name": "lc-auditing-shared-jwt-secret"
                        }
                    }
                  },
                  {
                    "name": "SPRING_MAIL_USERNAME",
                    "valueFrom": {
                        "secretKeyRef": {
                          "key": "user",
                          "name": "email-smtp-credentials"
                        }
                    }
                  },
                  {
                    "name": "SPRING_MAIL_PASSWORD",
                    "valueFrom": {
                        "secretKeyRef": {
                          "key": "password",
                          "name": "email-smtp-credentials"
                        }
                    }
                  },
                  {
                    "name": "SPRING_DATASOURCE_USERNAME",
                    "valueFrom": {
                        "secretKeyRef": {
                          "key": "username",
                          "name": $._config.lctenantmgmcmp.dbCredentialsSecret
                        }
                    }
                  },
                  {
                    "name": "SPRING_DATASOURCE_PASSWORD",
                    "valueFrom": {
                        "secretKeyRef": {
                          "key": "password",
                          "name": $._config.lctenantmgmcmp.dbCredentialsSecret
                        }
                    }
                  },
                  {
                    "name": "KEYCLOAK_CREDENTIALS_USERNAME",
                    "valueFrom": {
                        "secretKeyRef": {
                          "key": "username",
                          "name": $._config.lctenantmgmcmp.keycloakUserSecret
                        }
                    }
                  },
                  {
                    "name": "KEYCLOAK_CREDENTIALS_PASSWORD",
                    "valueFrom": {
                        "secretKeyRef": {
                          "key": "password",
                          "name": $._config.lctenantmgmcmp.keycloakUserSecret
                        }
                    }
                  }
                ],
                "image": $._config.lctenantmgmcmp.image,
                "volumeMounts": [
                  {
                    "name": "secrets-store01-inline",
                    "mountPath": "/mnt/secrets-store",
                    "readOnly": true
                  }
                ],
                "imagePullPolicy": $._config.lctenantmgmcmp.imagePullPolicy,
                "livenessProbe": {
                  "failureThreshold": 10,
                  "initialDelaySeconds": 40,
                  "periodSeconds": 30,
                  "successThreshold": 1,
                  "tcpSocket": {
                    "port": 8080
                  },
                  "timeoutSeconds": 1
                },
                "name": $._config.lctenantmgmcmp.name,
                "ports": [
                  {
                    "containerPort": 8080,
                    "name": "http",
                    "protocol": "TCP"
                  },
                  {
                    "containerPort": 18080,
                    "name": "actuator",
                    "protocol": "TCP"
                  }
                ],
                "readinessProbe": {
                  "failureThreshold": 10,
                  "httpGet": {
                    "path": "/actuator/health",
                    "port": 18080,
                    "scheme": "HTTP"
                  },
                  "initialDelaySeconds": 40,
                  "periodSeconds": 30,
                  "successThreshold": 1,
                  "timeoutSeconds": 1
                },
                "resources": {
                  "limits": {
                    "cpu": $._config.lctenantmgmcmp.resources.limits.cpu,
                    "memory": $._config.lctenantmgmcmp.resources.limits.memory
                  },
                  "requests": {
                    "cpu": $._config.lctenantmgmcmp.resources.requests.cpu,
                    "memory": $._config.lctenantmgmcmp.resources.requests.memory
                  }
                },
                "terminationMessagePath": "/dev/termination-log",
                "terminationMessagePolicy": "File"
              }
            ],
            "volumes": [
              {
                "name": "secrets-store01-inline",
                "csi": {
                  "driver": "secrets-store.csi.k8s.io",
                  "readOnly": true,
                  "volumeAttributes": {
                    "secretProviderClass": "lc-tenant-mgm-db-credentials"
                  }
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
    service: k.util.serviceFor(self.deployment)
  },
}