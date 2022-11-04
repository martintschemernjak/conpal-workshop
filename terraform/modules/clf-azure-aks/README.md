## Azure Kubernetes Service Cluster

![](https://img.shields.io/badge/maturity-incubating-yellow)

This module creates

- An AKS cluster with an auto-scaling nodepool
- An inbound public ip address that can be used in the ingress controller and can be assigned to a dns zone
- An outbound public ip address, that can be used for whitelisting other services like db, redis,...
- A user assigned identity that is assigned to the AKS cluster.
- A user assigned kubelet identity with container registry pull rights
- Integration into log analytics and monitoring

Names of all created resources are prefixed with the project name.

See inputs and outputs section on what needs to be defined, what is optional and what you can expect as an output.

#### IP Whitelisting

AKS cluster does not provide firewall rules (like for databases) or direct IP restrictions (like for AppServices).
Support
for [ADR-004](https://confluence.cloudflight.io/display/CAT/ADR-004+-+Private+vs.+public+availability+of+applications+in+the+Cloud)
stating that stages are per default secured with IP Whitelisting is done directly on the nginx ingress controller
running inside the AKS cluster. For example to only allow traffic from Cloudflight IP addresses use ingress option

```
'nginx.ingress.kubernetes.io/whitelist-source-range': '185.225.96.3/32,                                                                  
                                                       185.225.96.4/31,
                                                       185.225.96.6/32,
                                                       185.225.96.35/32,
                                                       185.225.96.36/31,
                                                       185.225.96.38/32,
                                                       185.225.98.7/32,
                                                       185.225.96.195/32,
                                                       185.225.96.196/31,
                                                       5.2.197.133/32,
                                                       217.110.241.10/32,
                                                       185.89.162.202/32,
                                                       82.218.187.242/32,
                                                       185.225.97.90/31,
                                                       185.225.97.92/30,
                                                       185.225.97.96/30'
```

Alternative approach would be to setup an Azure Firewall in front of the AKS but this approach is not supported by this
module at the moment.

<!-- DO NOT REMOVE THESE COMMENTS -->

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->
