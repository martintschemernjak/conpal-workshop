local nginx =(import 'cloudflight-libsonnet/infrastructure/nginx-ingress/nginx-ingress.libsonnet')
 {
  _config+: {
    nginxingress: {
      name: 'nginx-ingress',
      loadBalancerIP: error 'you need a static loadbalancer (public ip)',
    },
    namespace: {
      name: error 'you need to set a name for the namespace',
    },
  },
  namespacemain: {
    "apiVersion": "v1",
    "kind": "Namespace",
    "metadata": {
      "labels": {
        "kubernetes.io/metadata.name": $._config.namespace.name,
        "digest-resolution": "enabled"
      },
      "name": $._config.namespace.name,
    },
    "spec": {
      "finalizers": [
        "kubernetes"
      ]
    }
  },
  namespacejobs: {
    "apiVersion": "v1",
    "kind": "Namespace",
    "metadata": {
      "labels": {
        "kubernetes.io/metadata.name": $._config.namespace.name + '-jobs',
        "digest-resolution": "enabled"
      },
      "name": $._config.namespace.name + '-jobs',
    },
    "spec": {
      "finalizers": [
        "kubernetes"
      ]
    }
  },
};

local cert = (import 'cloudflight-libsonnet/infrastructure/cert-manager/cert-manager.libsonnet')
{
  _config+: {
    certmanager: {
      name: 'cert-manager',
      namespace: 'cert-manager',
      aks: true,
    },
  },
};


local digester = {
  namespace: {
    
      "apiVersion": "v1",
      "kind": "Namespace",
      "metadata": {
        "labels": {
          "control-plane": "controller-manager",
          "digester-injection": "disabled",
          "digester/system": "yes",
          "istio-injection": "disabled"
        },
        "name": "digester-system"
      }
    
  }
};


nginx + cert + digester