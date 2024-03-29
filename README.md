# docker-jupyter-cdms-light
Docker CDMS image for JupyterHub to be used together with the CDMS software stack on CVMFS

First rebuilt the Jupyter Docker stacks out of Centos 7 instead of Ubuntu,
see:

<https://github.com/zonca/jupyter-docker-stacks-centos7>

I build this manually (later will possibly setup autobuild) and push to Docker Hub:

<https://hub.docker.com/repository/docker/zonca/jupyter-docker-stacks-centos7>

We are interested in the image tagged `tensorflow`.

Finally we inherit from that image to create `docker-jupyter-cdms-light`:

<https://github.com/zonca/docker-jupyter-cdms-light>

As examples, checkout the `Dockerfile` files in <https://github.com/zonca/jupyter-docker-stacks-centos7>

## Versioning

![Calver badge](https://img.shields.io/badge/calver-YY.0M.MICRO-22bfda.svg)

Generally we update a few times a year and we do 3/4 releases the same day, so let's use same versioning system used by Ubuntu:

`YY.0M.MICRO`

See <https://calver.org/>

Better to not use `latest` in production, always make a tag and use that.  See [the Image build section](#image-build) for instructions on how to do this.

## Image build

The container is hosted [on DockerHub](https://hub.docker.com/r/zonca/docker-jupyter-cdms-light)

Unfortunately [Docker stopped providing free autobuilds](https://www.docker.com/blog/changes-to-docker-hub-autobuilds),
so now we need to build a new image on a machine with Docker and then push to Dockerhub.

The `Makefile` in this directory provides useful docker commands.  All commands assume (1) that you set a `VERSION` environment variable for the tag (see [the versioning section](#Versioning)) and (2) that you can run `docker` without `sudo`.  See [the Docker documentation](https://docs.docker.com/engine/install/linux-postinstall/) if you need to set this up.

* `make build` builds a container from the Dockerfile
* `make shell` will drop you into an image shell; useful if you want to check anything before pushing
* `make push` uploads the container to [dockerhub](https://hub.docker.com/r/zonca/docker-jupyter-cdms-light).  For this command to work you will need access to this dockerhub project - get a dockerhub account if you don't already have one and request access from the maintainer of this repository.  You can `make login` if you are not already authenticated to dockerhub. 

If your shell supports tab completion, `make` <kbd>space</kbd><kbd>tab</kbd><kbd>tab</kbd> will show all available commands (or "targets" in make-language).  You can also open `Makefile` in a text editor to see available targets.

## Deploy in production

The version of the image used in production is defined in `config_standard_storage.yaml`:

```yaml
  image:
    name: "zonca/docker-jupyter-cdms-light"
    tag: "2020.11.25"
```

need to update that and then run `install_jhub.sh`.
