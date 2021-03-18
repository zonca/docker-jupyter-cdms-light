FROM zonca/jupyter-docker-stacks-centos7:tensorflow-2020.07

COPY install_cdms_kernels /usr/local/bin/
# automatic run of the install kernels script was not working
# disabled it
# see https://github.com/det-lab/jupyterhub-deploy-kubernetes-jetstream/issues/27
# COPY install_cdms_kernels /usr/local/bin/before-notebook.d/

USER root

RUN yum install -y vim-enhanced nano emacs texlive texlive-cm-super texlive-dvipng texlive-dvipng-bin

USER $NB_UID

# install conda packages and jupyter lab extensions

RUN conda upgrade --quiet --yes 'jupyterlab' ipympl ipywidgets && \
    conda install --quiet --yes \
    'jupyterlab-system-monitor' \
    && \
    conda clean --all -f -y && \
    rm -rf "/home/${NB_USER}/.cache/yarn" && \
    rm -rf "/home/${NB_USER}/.node-gyp" && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
