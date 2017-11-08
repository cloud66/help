<!-- usedin: [ _legacy_docker/deployment/docker-service-configuration-v1.md, _maestro/Deployment/docker-service-configuration-v1.md, _skycap/deployment/docker-service-configuration-v1.md] -->


## Service configurations

Below is a table of the available configurations for a given service with a brief description. For more detailed information about an option, click the link provided.





<table class="table table-bordered table-striped table-small"> 
   <tbody> 
    <tr> 
     <td> <strong>Option</strong> </td> 
     <td> <strong>Description</strong> </td> 
    </tr> 
    <tr> 
     <td> <a href="{% if include.product == "legacy_docker" %}https://help.cloud66.works/legacy_docker/deployment/building-your-service.html{% else %}https://help.cloud66.works/skycap/deployment/building-your-service.html{%endif%}">build_command</a> </td> 
     <td> Specifies the command you would like to run during stack build. </td> 
    </tr> 
    <tr> 
     <td> <a href="{% if include.product == "legacy_docker" %}https://help.cloud66.works/legacy_docker/deployment/building-your-service.html{% else %}https://help.cloud66.works/skycap/deployment/building-your-service.html{%endif%}">build_root</a> </td> 
     <td> Specifies the directory of your repository in which you wish to run your Docker build. </td> 
    </tr> 
    <tr> 
     <td> <a href="{% if include.product == "legacy_docker" %}https://help.cloud66.works/legacy_docker/deployment/building-your-service.html{% else %}https://help.cloud66.works/skycap/deployment/building-your-service.html{%endif%}">command</a> </td> 
     <td> Specifies the command used to start your container. </td> 
    </tr> 
    <tr> 
     <td> <a href="{% if include.product == "skycap" %}https://help.cloud66.works/maestro/stack-management/scaling.html{% else %}https://help.cloud66.works/{{ include.product }}/stack-management/scaling.html{% endif %}">constraints</a> </td> 
     <td> Specifies <a href="{% if include.product == "skycap" %}https://help.cloud66.works/maestro/stack-management/scaling.html{% else %}https://help.cloud66.works/{{ include.product }}/stack-management/scaling.html{% endif %}">container amount</a> or <a href="https://help.cloud66.works/{{ include.product }}/stack-management/service-resources.html">resource</a> constraints for a service across the cluster. </td> 
    </tr> 
    <tr> 
     <td> <a href="{% if include.product == "legacy_docker" %}https://help.cloud66.works/legacy_docker/deployment/building-your-service.html{% else %}https://help.cloud66.works/skycap/deployment/building-your-service.html{%endif%}"</a> </td> 
     <td> Specifies the command you would like to run during stack deploy (runs once per service). </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/{{ include.product }}/deployment/service-network-configuration.html#dns_behaviour">dns_behaviour</a> </td> 
     <td> Specifies the dns behaviour for this service. One of the values: <em>versioned</em>, <em>non-versioned</em>. Default value is <em>versioned</em> </td> 
    </tr> 
    <tr> 
     <td> <a href="{% if include.product == "legacy_docker" %}https://help.cloud66.works/legacy_docker/deployment/building-your-service.html{% else %}https://help.cloud66.works/skycap/deployment/building-your-service.html{%endif%}">dockerfile_path</a> </td> 
     <td> Specifies the location of the Dockerfile to be used for building this service, eg. <em>docker/Dockerfile</em>. </td> 
    </tr> 
    <tr> 
     <td> tags </td> 
     <td> Arbitrary tags for services </td> 
    </tr> 
    <tr> 
     <td> <a href="{% if include.product == "legacy_docker" %}https://help.cloud66.works/legacy_docker/deployment/building-your-service.html{% else %}https://help.cloud66.works/skycap/deployment/building-your-service.html{%endif%}">git_url</a> </td> 
     <td> The Git repository URL your Docker image will be built with. </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/skycap/deployment/building-your-service.html#git-branch">git_branch</a> </td> 
     <td> The Git repository branch your Docker image will be based on. </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/skycap/deployment/building-your-service.html#use-habitus">use_habitus</a> </td> 
     <td> Use <a href="http://www.habitus.io">Habitus</a> build workflow </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/skycap/deployment/building-your-service.html#use-habitus">use_habitus_step</a> </td> 
     <td> The <a href="http://www.habitus.io">Habitus</a> step to use for the build. </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/{{ include.product }}/stack-management/service-lifecycle-management.html#health">health (CSv1)</a> </td> 
     <td> One of the values: <em>default</em>, <em>none</em> or a hash containing at least one of <em>type</em>, <em>endpoint</em>, <em>protocol</em>, <em>accept</em> or <em>timeout</em>. </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/{{ include.product }}/stack-management/service-lifecycle-management.html#health">health (CSv2)</a> </td> 
     <td> One of the values: <em>default</em>, <em>none</em> or a hash. </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/skycap/deployment/building-your-service.html#image">image</a> </td> 
     <td> The image you would typically run <code>docker pull</code> from. </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/{{ include.product }}/deployment/service-network-configuration.html#load_balancing">load_balancing</a> </td> 
     <td> Specifies the load balancing method for this service. Accepted values are: <em>roundrobin</em>, <em>sticky</em>, <em>closest</em>. Default value is <em>roundrobin</em> </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/{{ include.product }}/stack-management/logging.html">log_folder</a> </td> 
     <td> Folder your services logs to, mounted to <code>/var/log/containers/service</code> on the host filesystem. </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/{{ include.product }}/deployment/service-network-configuration.html#ports">ports</a> </td> 
     <td> The ports that are running within the container, as well as their corresponding external ports. </td> 
    </tr> 
    <tr> 
     <td> privileged <em>(default: false)</em> </td> 
     <td> Boolean value to indicate whether the container should be <a href="https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities">run with extended privileges</a>. </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/{{ include.product }}/stack-management/service-lifecycle-management.html#pre_start">pre_start_signal</a> </td> 
     <td> This is a signal that is sent to the existing running containers of the service before the new service containers are started during deployment. </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/{{ include.product }}/stack-management/service-lifecycle-management.html#pre_stop">pre_stop_sequence</a> </td> 
     <td> This is a stop sequence that is executed on your running containers before they are shut down. </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/{{ include.product }}/stack-management/service-lifecycle-management.html#requires">requires</a> </td> 
     <td> Array of other defined service names that should be started before this service during build and deployment. </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/{{ include.product }}/stack-management/service-lifecycle-management.html#restart">restart_on_deploy</a> <em>(default: true)</em> </td> 
     <td> Boolean value to indicate whether the containers of this service should be restarted during deployment. </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/{{ include.product }}/stack-management/service-lifecycle-management.html#stop_grace">stop_grace</a> </td> 
     <td> Duration between the Docker <code>TERM</code> and <code>KILL</code> signals when Docker stop is run and a container is stopped. </td> 
    </tr> 
    <tr> 
     <td> <a href="https://help.cloud66.works/{{ include.product }}/deployment/service-network-configuration.html#traffic_matches">traffic_matches</a> </td> 
     <td> The automatically configured traffic names in your Nginx config that will route traffic to these containers based on request DNS name. Allows microservices on the same port routes by subdomain for instance. </td> 
    </tr> 
    <tr> 
     <td> <a href="/https://help.cloud66.works/{{ include.product }}/stack-management/service-storage.html">volumes</a> </td> 
     <td> The volumes that are mounted from your host into your container. <span style="background-color: #FFFF00"><strong>Note:</strong>it must be absolute path.</span> </td> 
    </tr> 
    <tr> 
     <td> work_dir </td> 
     <td> Specifies the <a href="https://docs.docker.com/reference/builder/#workdir">working directory</a> in your image for any command to be run.<br> </td> 
    </tr> 
    <tr> 
     <td> <a href="https://cloud66-help.helpscoutdocs.com/article/153-service-life-cycle-management#pre_stop_command">pre_stop_command</a> </td> 
     <td> This hook is called immediately before a container is terminated. <span style="background-color: yellow"><strong>Note: </strong>Only applies to container version 2 stacks (Kubernetes)</span> </td> 
    </tr> 
    <tr> 
     <td> <a href="https://cloud66-help.helpscoutdocs.com/article/153-service-life-cycle-management#post_start_command">post_start_command</a> </td> 
     <td> This hook executes immediately after a container is created. <span style="background-color: yellow"><strong>Note: </strong>Only applies to container version 2 stacks (Kubernetes)</span> </td> 
    </tr> 
   </tbody> 
  </table> 