(import 'setup.libsonnet') +
{
  _config+:: {
    nginxingress+: {
      loadBalancerIP: '137.117.248.241',
    },
    namespace+: {
      name: 'lancrypt',
    },
  },
}

