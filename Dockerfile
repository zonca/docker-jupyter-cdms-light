FROM zonca/jupyter-docker-stacks-centos7:tensorflow-2020.07

COPY install_cdms_kernels /usr/local/bin/
# automatic run of the install kernels script was not working
# disabled it
# see https://github.com/det-lab/jupyterhub-deploy-kubernetes-jetstream/issues/27
# COPY install_cdms_kernels /usr/local/bin/before-notebook.d/

USER root

RUN echo $'[mariadb] \n\
name = MariaDB \n\
baseurl = http://yum.mariadb.org/10.3/centos7-amd64 \n\
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB \n\
gpgcheck=1 ' >> /etc/yum.repos.d/MariaDB.repo

RUN yum install -y vim-enhanced nano emacs \
    texlive texlive-cm-super texlive-dvipng texlive-dvipng-bin \
    MariaDB-client MariaDB-devel MariaDB-connect-engine

RUN curl https://rclone.org/install.sh | bash

RUN curl https://rclone.org/install.sh | bash

USER $NB_UID

# upgrade all conda packages

RUN conda upgrade --quiet --yes --all && \
    conda install --quiet --yes \
    'jupyterlab-system-monitor' \
    conda clean --all -f -y && \
    rm -rf "/home/${NB_USER}/.cache/yarn" && \
    rm -rf "/home/${NB_USER}/.node-gyp" && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

RUN pip install mariadb sqlalchemy
