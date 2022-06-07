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

## Image build on DockerHub (stopped working)

This is setup with [autobuild on DockerHub](https://hub.docker.com/r/zonca/docker-jupyter-cdms-light)
It automatically builds `master` as `latest` and it builds all the tags.

Better not use `latest` in production, always make a tag and use that.

Unfortunately [Docker stopped providing free autobuilds](https://www.docker.com/blog/changes-to-docker-hub-autobuilds),
so now we need to build a new image on a machine with Docker and then push to Dockerhub:

```
sudo docker build -t zonca/docker-jupyter-cdms-light:<version> .
sudo docker login
sudo docker push zonca/docker-jupyter-cdms-light:<version>
```

See the section above for information on defining the version.

## Deploy in production

The version of the image used in production is defined in `config_standard_storage.yaml`:

```yaml
  image:
    name: "zonca/docker-jupyter-cdms-light"
    tag: "2020.11.25"
```

need to update that and then run `install_jhub.sh`.
