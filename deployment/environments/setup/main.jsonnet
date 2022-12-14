(import 'setup.libsonnet') +
{
  _config+:: {
    nginxingress+: {
      loadBalancerIP: '20.160.17.75',
    },
    namespace+: {
      name: 'lancrypt',
    },
  },
}

