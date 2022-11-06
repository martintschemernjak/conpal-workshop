(import 'lc-tenant-mgm.libsonnet') +
{
  _config+:: {
    lctenantmgmcmp+: {
      name: 'lc-tenant-mgm-cmp',
      image: 'crlancryptdevwesteurope001.azurecr.io/applications/lc-tenant-mgm-cmp:1.0.22-SNAPSHOT',
      replicas: 2,
      springProfile: 'dev',
      imagePullPolicy: 'Always',
      dbCredentialsSecret: 'lc-tenant-mgm-db-credentials',
      keycloakUserSecret: 'lc-keycloak-admin-user',
      resources: {
        limits: {
            cpu: '600m',
            memory: '1Gi'
        },
        requests: {
            cpu: '400m',
            memory: '768Mi'
        }
      },
    },
  },
}

