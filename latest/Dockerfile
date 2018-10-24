FROM renku/singleuser:latest

# Uncomment and adapt if code is to be included in the image
# COPY src /code/src

# install the python dependencies
COPY environment.yml environment.yml
RUN conda env update -q -f environment.yml && \
    conda clean -y --all && \
    conda env export -n "root"
