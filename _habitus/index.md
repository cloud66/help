---
layout: post
template: oss
externallink: https://github.com/cloud66-oss/habitus
title: Welcome to Habitus
label: Habitus
lead: A Docker Build Flow Tool
legacy: false
permalink: /:collection/index.html
index: true
---


<p class="lead">Habitus is a standalone Docker build flow tool. It is a command line tool that builds Docker images based on their `Dockerfile` and a `build.yml`.</p>

<a class="ButtonOutlined" href="https://github.com/cloud66-oss/habitus" target="_blank">
    <img src="/images/ui/github.svg" class="u-inlineBlock u-verticalAlignMiddle" width="30" alt="">
    <span class="ButtonOutlined-text u-inlineBlock u-verticalAlignMiddle">View habitus on Github</span>
</a>

## Using Habitus

You can install Habitus by downloading a single executable for your platform of choice or building it from scratch (see the Installation Section). Getting started with Habitus is easy. You can use a `build.yaml` file to define the build flow and steps of your project.

### Build files

Habitus uses a yml file as a descriptor for builds. Here is an example:

```yaml
build:
  version: 2016-02-13 // version of the build schema.
  steps:
    - builder:
      name: builder
      dockerfile: Dockerfile.builder
      artifacts:
        - /go/src/github.com/cloud66/iron-mountain/iron-mountain
        - /go/src/github.com/cloud66/iron-mountain/config.json
        - /go/src/github.com/cloud66/iron-mountain/localhost.crt
        - /go/src/github.com/cloud66/iron-mountain/localhost.key
      cleanup:
        commands:
          - rm -rf /root/.ssh/
    - deployment:
      name: ironmountain
      dockerfile: Dockerfile.deployment
      depends_on:
        - builder
    - uploader:
      name: uploader
      dockerfile: Dockerfile.uploader
      depends_on:
        - ironmountain
      command: s3cmd --access_key=_env(ACCESS_KEY) --secret_key=_env(SECRET_KEY) put /app/iron-mountain s3://uploads.aws.com
```

Build files can be made up of multiple steps. Each step is independent of the other ones and downstream steps can use upstream ones as source (in `FROM` command).

In the example above, there are three steps: `builder`, `deployment` and `uploader`. All steps work out of the same working directory. `dockerfile` states which Dockerfile is used to build this step.

Here is a list of all step elements:

-   `name:` Name of the generated image
-   `dockerfile:` Dockerfile used to build the step
-   `artifacts:` List of all files to be copied out of the image once it’s built. See below
-   `cleanup:` List of all cleanup steps to run on the image once the step is finished. See below
-   `depends_on:`Lists all the steps this step depends on (and should be built prior to this step’s build)
-   `command:`A command that will run in the running container after it’s built

### Artifacts

Artifacts are files to be copied outside of a build image in a step. This can be used when a step is build of a compiled language like Go or Java where the image requires build dependencies. The next step can then use the build step’s artifacts in a runtime dependency only image.

Each artefact has two parts: source and destination. Source is the path from within the image and destination where the file will be copied to on the “build server”. If destination is missing, the current folder will be used. Full path and file permissions of the source will be preserved during copy. So a file that comes from `/app/build/result/abc` of the image will go to `./app/build/result/abc` of the build server if no destination is set.

Here is an example:

` - /go/src/service/go-service`

or

`- /go/src/service/go-service:/tmp/go-service`

Artifacts are copied from the container and can be used with `ADD` or `COPY` commands in downstream steps. Habitus copies artefact file permissions as well.

Here is an example that uses an artefact generated in step `builder`

```dockerfile
FROM ubuntu
ADD ./iron-mountain /app/iron-mountain
```

## Doing More with Habitus

### Cleanup

Cleanup is a step that runs after the build is finished for a step. At the moment, cleanup is limited to commands:

```yaml
cleanup:
  commands:
    - apt-get purge -y man  perl-modules vim-common vim-tiny libpython3.4-stdlib:amd64 python3.4-minimal xkb-data libx11-data eject python3 locales golang-go
    - apt-get clean autoclean
    - apt-get autoremove -y
    - rm -rf /var/lib/{apt,dpkg,cache,log}/
```

This runs the commands in the provided order on the image and then as a last step squashes the image to remove anything that’s been removed. This is particularly useful when it comes to private information like ssh private keys that need to be on the image during the build (to pull git repos for example) but can’t be published as part of the built image.

### Image sequencing

Habitus allows dovetailing (sequencing) of images from different steps. This means a step can use the image built by the previous step as the source in its Dockerfile `FROM` command. This is done automatically if `FROM` command refers to an image name used by a previous step.

Habitus automatically parses the `FROM` image name and replaces it with the correct name when it is used in multi-tenanted setup. This enables multiple builds of the same build file to run in parallel with different session UIDs (see below).

Please note if you are using step A’s result in step B’s `FROM` statement, you need to make sure A is listed under `depends_on` attribute of B. Otherwise both A and B will be built in parallel.

### Step dependencies

Steps can depend on each other. This can be specified by the `depends_on` attribute.

Steps can depend on one or more of the other steps. This will determine the build order for steps. Independent steps are built in parallel and according to the build order defined by dependencies.

### Environment variables

Environment variables can be used in the build file with the `_env(VAR)` format:

```yaml
artifacts:
  - /go/src/go-service/_env(SERVICE_NAME)
```

This will be replaced before the build file is fed into the build engine. By default Habitus inherits all environment variables of its parent process. This can be overridden by passing environment variables into Habitus explicitly through the env command parameter:

```shell
$ habitus -env SERVICE_NAME=abc -env RAILS_ENV=production
```

In the example above, you can pass in AWS S3 key and secret like this:

```shell
$ habitus -env ACCESS_KEY=$ACCESS_KEY -env SECRET_KEY=$SECRET_KEY
```

### Running commands

Habitus allows you to run an arbitary command inside of a built container. This can be useful in many cases like uploading the build artifacts to webserver, resetting your exception handling service after each build or starting your release process.

`command` attribute is optional. If present, the image is built and a container is started based on it to run the command.

`command` runs after the build, cleanup and copying of the artifacts are done.

An example to upload a build artefact to S3 can be like this

```dockerfile
FROM cloud66/uploader
ADD ./iron-mountain /app/iron-mountain
```

`cloud66/uploader` is a simple Docker image that has [S3CMD] installed on it.

The Dockerfile here is a simple one that starts from `cloud66/uploader` and adds one of the build artifacts to the image so it can be uploaded to S3.

  [S3CMD]: http://s3tools.org/s3cmd

### Command line parameters

Habitus accepts the following command line parameters:

-   `f`: Path to the build file. If not specified, it will default to `build.yml` in the work directory.
-   `d`: Path to work directory. This is the path where Dockerfiles should exist for each step and the build happens. Defaults to the current directory.
-   `no-cache`: Don’t use docker build caching.
-   `suppress`: Suppress docker build output.
-   `rm`: Remove intermediate built images.
-   `force-rm`: Forcefully remove intermediate images.
-   `uid`: A unique ID used for a build session to allow multi-tenancy of Habitus
-   `level`: Logging level. Acceptable values: `debug`, `info`, `notice`, `warning`, `error` and critical. Defaults to `debug`
-   `host`: Address for Docker daemon to run the build. Defaults to the value of `$DOCKER_HOST`.
-   `certs`: Path of the key and cert files used to connect to the Docker daemon. Defaults to `$DOCKER_CERT_PATH`
-   `env`: Environment variables used in the build process. If not specified Habitus inherits all environment variables of the parent process.
-   `keep-all`: Overrides the keep flag for all steps so you can inspect and debug the created images of each step without changing the build file.
-   `no-cleanup`: Don’t run cleanup commands. This can be used for debugging and removes the need to run as sudo
-   `force-rmi`: Forces removal of unwanted images after the build
-   `noprune-rmi`: Doesn’t prune unwanted images after the build

### Multi-tenancy for Habitus

Habitus supports multi-tenancy of builds by using a `uid` parameter.

All builds and images will be tagged with the `uid` for this unless a step name explicitly has a tag. In that case the tag is concatenated with the `-uid` flag.


## Contributing

### Development Environment for Habitus

Habitus requires running in privileged more (sudo) so it can run the squash method (keeping file permissions across images). It also requires the following environment variables: `DOCKER_HOST` and `DOCKER_CERT_PATH`. These are usually available when Docker is running on a machine, but might not be available in sudo mode. To fix this, you can pass them into the app with command line params:

```shell
$ sudo habitus –host $DOCKER_HOST –certs $DOCKER_CERT_PATH
```

### Dependencies

Habitus Squash feature needs [gnu tar](https://www.gnu.org/software/tar/) to be available on the machine. ([Gnu Tar installation instructions on OSX](https://github.com/cloud66/habitus/blob/gh-pages/gnu-tar.md))

