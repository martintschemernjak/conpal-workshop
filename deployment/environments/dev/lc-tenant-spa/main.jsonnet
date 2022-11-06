(import 'lc-spa.libsonnet') +
{
  _config+:: {
    lcspa+: {
      name: 'lc-tenant-spa',
      host: 'portal-dev.lancrypt.com',
      image: 'crlancryptdevwesteurope001.azurecr.io/applications/lc-tenant-spa:1.0.47',
      portalFeCmpBaseUrl: 'https://portal-fe-cmp-dev.lancrypt.com',
      productionMode: false,
      recaptchaKey: '6LfNkHIiAAAAADsTZU8nctBEFKkT97JfK8PVGsGa',
      keycloak: {
        host: 'https://auth-dev.lancrypt.com/auth/',
        realm: 'lc-tenant',
        clientId: 'lc-tenant-spa',
        redirectUrl: 'https://portal-dev.lancrypt.com'
      }
    },
  },
}

