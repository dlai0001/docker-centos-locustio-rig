FROM centos:7
MAINTAINER David Lai


#RUN apk -U add ca-certificates python python-dev py-pip build-base && \
#    pip install locustio pyzmq && \
#    apk del python-dev && \
#    rm -r /var/cache/apk/* && \

# Install Python Environment
RUN curl -o get_pip.py https://bootstrap.pypa.io/get-pip.py
RUN python get_pip.py
RUN rm get_pip.py

# Create working Directory
RUN mkdir /locust
WORKDIR /locust

# Copy project files to Container's /locust dir.
ADD . /locust
RUN test -f requirements.txt && pip install -r requirements.txt; exit 0

# Open ports for webui, and master/slave communications
EXPOSE 8089 5557 5558

# TODO: create entry points for running locust as master and slave
# ENTRYPOINT [ "/usr/bin/locust" ]