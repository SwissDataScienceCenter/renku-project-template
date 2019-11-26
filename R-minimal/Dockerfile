FROM renku/singleuser-r:0.4.3-renku0.8.2

# Uncomment and adapt if code is to be included in the image
# COPY src /code/src

# install the R dependencies
COPY install.R /tmp/
RUN R -f /tmp/install.R

# install the python dependencies
COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt
