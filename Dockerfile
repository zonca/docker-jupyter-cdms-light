FROM zonca/jupyter-docker-stacks-centos7:tensorflow

COPY install_cdms_kernels.sh /usr/local/bin/
COPY install_cdms_kernels.sh /usr/local/bin/start-notebook.d/
