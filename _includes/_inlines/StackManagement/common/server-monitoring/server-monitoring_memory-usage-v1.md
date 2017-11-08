<!-- usedin: [ _legacy_docker/stack-management/server-monitoring-v1.md, _maestro/stack-management/server-monitoring-v1.md, _node/stack-management/server-monitoring-v1.md, _rails/stack-management/server-monitoring-v1.md] -->


#### Memory usage
Collectd uses the [Memory plugin](https://collectd.org/wiki/index.php/Plugin:Memory) to collect physical memory utilization. The values are reported by their use by the operating system, and include _used_, _buffered_, _cached_ and _free_.

![Collectd memory usage](http://assets.cloud66.com/help/images/collectd_memory.png)
