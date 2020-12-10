# For finding latest versions of the base image see
# https://github.com/SwissDataScienceCenter/renkulab-docker
ARG RENKU_BASE_IMAGE=renku/renkulab-py:3.7-0.7.3
FROM ${RENKU_BASE_IMAGE}

# Uncomment and adapt if code is to be included in the image
# COPY src /code/src

# Uncomment and adapt if your R or python packages require extra linux (ubuntu) software
# e.g. the following installs apt-utils and vim; each pkg on its own line, all lines
# except for the last end with backslash '\' to continue the RUN line
#
# USER root
# RUN apt-get update && \
#    apt-get install -y --no-install-recommends \
#    apt-utils \
#    vim
# USER ${NB_USER}

# Uncomment and adapt if you want to automatically install
# python dependencies when the Docker image builds (pip or conda)
# Note: you will need to add a (pip) requirements.txt file
#       AND a (conda) environment.yml file for the below code to run,
#       but you can remove one or the other.
#
# COPY requirements.txt environment.yml /tmp/
# RUN conda env update -q -f /tmp/environment.yml && \
#    /opt/conda/bin/pip install -r /tmp/requirements.txt && \
#    conda clean -y --all && \
#    conda env export -n "root"

# RENKU_VERSION determines the version of the renku CLI
# that will be used in this image. To find the latest version,
# visit https://pypi.org/project/renku/#history.
ARG RENKU_VERSION=0.12.2

########################################################
# Do not edit this section and do not add anything below

RUN if [ -n "$RENKU_VERSION" ] ; then \
    pipx uninstall renku && \
    pipx install --force renku==${RENKU_VERSION} \
    ; fi

########################################################
