<!--  usedin: [ _legacy_docker/stack-management/network-configuration-v1.md, _maestro/stack-management/network-configuration-v1.md, _node/stack-management/network-configuration-v1.md, _rails/stack-management/network-configuration-v1.md] -->


## Configure network traffic

By default, all traffic is allowed to visit your web servers on ports 80, 443, 8080 and 8443. The _Traffic_ tab allows you to control this, and has two sections: _allowed_ traffic sources and _denied_ traffic sources.

For each of these fields, you can enter a single IP address, a comma-separated list, or range. For example:



{%include _inlines/StackManagement/common/network-configuration/code_network-configuration_configure-network-traffic--v1.md  product = include.product %}



