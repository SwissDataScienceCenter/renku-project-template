FROM renku/singleuser:0.4.0-renku0.7.0

# Uncomment and adapt if code is to be included in the image
# COPY src /code/src

# install the python dependencies
COPY requirements.txt environment.yml /tmp/
RUN conda env update -q -f /tmp/environment.yml && \
    /opt/conda/bin/pip install -r /tmp/requirements.txt && \
    conda clean -y --all && \
    conda env export -n "root"
