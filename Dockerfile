ARG BASE_CONTAINER=jupyter/tensorflow-notebook
FROM $BASE_CONTAINER

# Set when building on Travis so that certain long-running build steps can
# be skipped to shorten build time.
ARG TEST_ONLY_BUILD

USER root

# Install system packages with APT

# RUN apt-get update && \
#    apt-get install -y --no-install-recommends \
#    PACKAGENAMEHERE && \
#    rm -rf /var/lib/apt/lists/*

USER $NB_UID

# Install conda packages

RUN conda install --quiet --yes \
    'black' \
    && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
