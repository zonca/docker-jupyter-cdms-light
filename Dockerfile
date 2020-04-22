FROM zonca/jupyter-docker-stacks-centos7:tensorflow

COPY install_cdms_kernels /usr/local/bin/
COPY install_cdms_kernels /usr/local/bin/before-notebook.d/
