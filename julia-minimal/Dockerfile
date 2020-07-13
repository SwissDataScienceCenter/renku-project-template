FROM renku/renkulab-julia:1.4.2-renku0.10.4-a31920c
# see https://github.com/SwissDataScienceCenter/renkulab-docker
# to swap this image for the latest version available

# Uncomment and adapt if code is to be included in the image
# COPY src /code/src

# Uncomment and adapt if your python, R, or Julia packages require extra linux (ubuntu) software
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
COPY requirements.txt environment.yml /tmp/
RUN conda env update -q -f /tmp/environment.yml && \
    /opt/conda/bin/pip install -r /tmp/requirements.txt && \
    conda clean -y --all && \
    conda env export -n "root"

# download and precompile any libaries to speed up startup time
COPY Project.toml Manifest.toml /tmp/
RUN mkdir /tmp/julia-pkg && \
    cp /tmp/Project.toml /tmp/Manifest.toml /tmp/julia-pkg/ && \
    julia -e'using Pkg; Pkg.activate("/tmp/julia-pkg/"); Pkg.instantiate(); Pkg.precompile()'
