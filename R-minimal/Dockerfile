FROM renku/singleuser-r:0.4.0-renku0.7.0

# Uncomment and adapt if code is to be included in the image
# COPY src /code/src

# install the python dependencies
COPY requirements.txt /tmp/
RUN pip3 install -r /tmp/requirements.txt
