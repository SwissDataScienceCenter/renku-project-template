# For finding latest versions of the base image see
# https://github.com/SwissDataScienceCenter/renkulab-docker
ARG RENKU_BASE_IMAGE=renku/renkulab-r:4.2.0-0.12.0
FROM ${RENKU_BASE_IMAGE}

# Uncomment and adapt if code is to be included in the image
# COPY src /code/src

# Uncomment and adapt if your R or python packages require extra linux (ubuntu) software
# e.g. the following installs apt-utils and vim; each pkg on its own line, all lines
# except for the last end with backslash '\' to continue the RUN line
#
USER root
RUN apt-get -y update && \
  apt-get clean && \
  apt-get install -y --no-install-recommends \
  apt-utils \
    libncurses5-dev \
    libncursesw5-dev \
    parallel \
    libgit2-dev \
    tk-dev \
    jq \
    curl \
    librsvg2-2 \
    librsvg2-dev \
    librsvg2-common

# note jq and curl are used in renv_install.sh
# librsvg2 libs are common dependencies of some R plotting libraries

USER ${NB_USER}

# install the R dependencies
## make the renv install script and renv.lock file
## available in the working dir and run the install
COPY renv_install.sh .
COPY renv.lock .
RUN bash renv_install.sh
## ensure renv lock is in the project directory
COPY renv.lock /home/rstudio/renv.lock
COPY install.R /tmp/
RUN R -f /tmp/install.R

# To apply a custom RStudio config uncomment the line below
# COPY .rstudio_config_dir/ /home/rstudio/.config/rstudio
# copy ~/.config/rstudio to .rstudio_config_dir to preserve changes when rebuilding the container

## Clean up the /home/rstudio directory to avoid confusion in nested R projects
RUN rm /home/rstudio/.Rprofile; rm /home/rstudio/renv.lock

# install the python dependencies
COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt

# RENKU_VERSION determines the version of the renku CLI
# that will be used in this image. To find the latest version,
# visit https://pypi.org/project/renku/#history.
ARG RENKU_VERSION={{ __renku_version__ | default("1.6.0") }}

########################################################
# Do not edit this section and do not add anything below

# Install renku from pypi or from github if it's a dev version
RUN if [ -n "$RENKU_VERSION" ] ; then \
        source .renku/venv/bin/activate ; \
        currentversion=$(renku --version) ; \
        if [ "$RENKU_VERSION" != "$currentversion" ] ; then \
            pip uninstall renku -y ; \
            gitversion=$(echo "$RENKU_VERSION" | sed -n "s/^[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+\(rc[[:digit:]]\+\)*\(\.dev[[:digit:]]\+\)*\(+g\([a-f0-9]\+\)\)*\(+dirty\)*$/\4/p") ; \
            if [ -n "$gitversion" ] ; then \
                pip install --force "git+https://github.com/SwissDataScienceCenter/renku-python.git@$gitversion" ;\
            else \
                pip install --force renku==${RENKU_VERSION} ;\
            fi \
        fi \
    fi

########################################################
