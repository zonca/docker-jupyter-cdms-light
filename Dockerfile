FROM zonca/jupyter-docker-stacks-centos7:tensorflow-2020.07

COPY install_cdms_kernels /usr/local/bin/
COPY install_cdms_kernels /usr/local/bin/before-notebook.d/

# install conda packages and jupyter lab extensions

RUN conda install --quiet --yes \
    'nbresuse' \
    && \
    conda clean --all -f -y && \
    jupyter labextension install jupyterlab-topbar-extension jupyterlab-system-monitor --no-build && \
    jupyter lab build -y && \
    jupyter lab clean -y && \
    npm cache clean --force && \
    rm -rf "/home/${NB_USER}/.cache/yarn" && \
    rm -rf "/home/${NB_USER}/.node-gyp" && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
