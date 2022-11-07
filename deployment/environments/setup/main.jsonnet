(import 'setup.libsonnet') +
{
  _config+:: {
    nginxingress+: {
      loadBalancerIP: '20.16.208.38',
    },
    namespace+: {
      name: 'lancrypt',
    },
  },
}

