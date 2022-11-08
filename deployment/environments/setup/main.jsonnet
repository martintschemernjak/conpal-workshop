(import 'setup.libsonnet') +
{
  _config+:: {
    nginxingress+: {
      loadBalancerIP: '52.232.34.155',
    },
    namespace+: {
      name: 'lancrypt',
    },
  },
}

