FROM renku/singleuser:latest

# Uncomment and adapt if code is to be included in the image
# COPY src /code/src

# install the python dependencies
COPY environment.yml environment.yml
RUN conda env create -q -f environment.yml && \
    conda clean -y --all && \
    conda env export -n "{{ name }}" && \
    $CONDA_DIR/envs/test-conda-python/bin/python -m ipykernel install --user --name "{{ name }}" --display-name "Python 3 ({{ name }})"
