# For finding latest versions of the base image see
# https://github.com/SwissDataScienceCenter/renkulab-docker
#ARG RENKU_BASE_IMAGE=renku/renkulab-py:3.7-0.7.3
#FROM ${RENKU_BASE_IMAGE}
FROM integralsw/osa-python:11.1-16-g88c002b7-20210507-170349-refcat-43.0-heasoft-6.29-python-3.8.2

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

# install the python dependencies
#COPY requirements.txt environment.yml /tmp/
#RUN conda env update -q -f /tmp/environment.yml && \
#    /opt/conda/bin/pip install -r /tmp/requirements.txt && \
#    conda clean -y --all && \
#    conda env export -n "root"

# RENKU_VERSION determines the version of the renku CLI
# that will be used in this image. To find the latest version,
# visit https://pypi.org/project/renku/#history.
ARG RENKU_VERSION=0.16.2

########################################################
# Do not edit this section and do not add anything below

RUN export HOME_OVERRRIDE=/tmp && source /init.sh && \
    if [ -n "$RENKU_VERSION" ] ; then \
        pip install setuptools==57.5.0 --ignore-installed; \
    fi

RUN export HOME_OVERRRIDE=/tmp && source /init.sh && \
    if [ -n "$RENKU_VERSION" ] ; then \
        pip uninstall renku && \
        pip install --force renku==${RENKU_VERSION} setuptools==57.5.0 \
    ; fi

########################################################

#  need to add suitable jupyterlab

RUN echo 'oda:x:1000:1000:ODA Interactive,,,:/tmp/jovyan:/bin/bash' >> /etc/passwd

USER oda

ENTRYPOINT bash -c 'export HOME_OVERRRIDE=/tmp/jovyan; mkdir $HOME_OVERRRIDE; cd /tmp/jovyan; source /init.sh; jupyter lab --ip 0.0.0.0 --no-browser'
