<!--  usedin: [ _legacy_docker/deployment/building-a-manifest-file-v1.md, _maestro/Deployment/building-a-manifest-file-v1.md, _node/deployment/building-a-manifest-file-v1.md, _rails/deployment/building-a-manifest-file-v1.md, _skycap/deployment/building-a-manifest-file-v1.md] -->


### Nginx

- **cors**: Enable [Cross Origin Resource Sharing](http://en.wikipedia.org/wiki/Cross-origin_resource_sharing) - this will be taken into account when your Nginx configuration is reloaded.
- **perfect_forward_secrecy** (_deprecated_): Enable [Perfect Forward Secrecy](http://en.wikipedia.org/wiki/Perfect_forward_secrecy) - this will be taken into account when your Nginx configuration is reloaded.



{%include _inlines/Deployment/common/building-a-manifest-file/code_building-a-manifest-file_nginx-oduction-v1.md  product = include.product %}



