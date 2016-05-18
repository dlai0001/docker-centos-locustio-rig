FROM centos:7
MAINTAINER David Lai

# Install Python Environment
RUN curl -o get_pip.py https://bootstrap.pypa.io/get-pip.py
RUN python get_pip.py
RUN rm get_pip.py

# Installing Locust.io
RUN pip install locustio

# Installing urwid for menus
RUN pip install urwid

# Create working Directory
RUN mkdir /locust
WORKDIR /locust

# Run.py is the main shell menu
ADD run.py /run.py
RUN chmod 755 /run.py

# Copy project files to Container's /locust dir.
ONBUILD ADD . /locust
ONBUILD RUN test -f requirements.txt && pip install -r requirements.txt; exit 0

# Open ports for webui, and master/slave communications
EXPOSE 8089 5557 5558

ENTRYPOINT /run.py


