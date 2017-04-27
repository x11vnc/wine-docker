# Builds a base Docker image for Ubuntu with Wine.
#
# The built image can be found at:
#
#   https://hub.docker.com/r/x11vnc/wine
#
# Authors:
# Xiangmin Jiao <xmjiao@gmail.com>

FROM x11vnc/ubuntu:16.04
LABEL maintainer Xiangmin Jiao <xmjiao@gmail.com>

WORKDIR /tmp

# Install Wine 2.0 from official Wine PPA
# http://ubuntuhandbook.org/index.php/2017/01/install-wine-2-0-ubuntu-16-04-14-04-16-10/
RUN add-apt-repository ppa:wine/wine-builds && \
    apt-get update && \
    dpkg --add-architecture i386 && \
    apt-get install -y --no-install-recommends \
        netcat \
        xterm \
        gettext \
        wine-staging && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PATH=/opt/wine-staging/bin:$PATH

WORKDIR $DOCKER_HOME
