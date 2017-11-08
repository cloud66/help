<!-- usedin: [ _legacy_docker/deployment/redeployment-hook-v1.md, _maestro/Deployment/redeployment-hook-v1.md, _node/deployment/redeployment-hook-v1.md, _rails/deployment/redeployment-hook-v1.md, _skycap/deployment/redeployment-hook-v1.md] -->


### Bitbucket Setup

On your stack detail page, click _Stack information_ in the right sidebar and copy the URL provided in the _Redeployment hook_ field. Next, visit your Bitbucket repository, click _Settings_ in the left sidebar, and then _Hooks_ in the settings menu that appears. In the _Select a hook_ field, select a _POST_ hook, click _Add hook_ and paste your redeployment hook URL into the field provided. Click _Save_ to confirm.
