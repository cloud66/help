<!-- usedin: [ _legacy_docker/getting-started/stack-definition-v1.md, _maestro/getting-started/stack-definition-v1.md, _node/getting-started/stack-definition-v1.md, _rails/getting-started/stack-definition-v1.md] -->


### Background workers (optional)

To relieve pressure from your application, we recommend that you use background workers to run memory-intensive processes. Cloud 66 makes it easy for you to [control and monitor these processes](https://help.cloud66.works/rails/deployment/proc-files.html), as well as [scale them]({% if include.product == "skycap" %}https://help.cloud66.works/maestro/stack-management/scaling.html{% else %}https://help.cloud66.works/{{ include.product }}/stack-management/scaling.html{% endif %}) at the click of a button.
