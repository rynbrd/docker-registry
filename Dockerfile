# set up the container environment
FROM phusion/baseimage:0.9.9
ENV HOME /root
ENV SETTINGS_FLAVOR prod
ENV DEBIAN_FRONTEND noninteractive
EXPOSE 80
CMD ["/sbin/my_init"]

# run commands in the container
RUN apt-get update -qy
RUN apt-get install -qy build-essential git-core libevent-dev libffi-dev liblzma-dev libssl-dev python-dev python-pip
RUN git clone https://github.com/dotcloud/docker-registry.git /opt/docker-registry
RUN rm -rf /opt/docker-registry/.git /opt/docker-registry/config/*
RUN pip install -r /opt/docker-registry/requirements.txt
RUN mkdir -p /etc/service/docker-registry /var/lib/docker/registry

# clean up after commands
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add files we need
ADD files/config.yml /opt/docker-registry/config/config.yml
ADD files/run /etc/service/docker-registry/run
RUN chmod 755 /etc/service/docker-registry/run
