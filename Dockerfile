#
# robo3t-docker Dockerfile
#

# Pull base image.
FROM jlesage/baseimage-gui:ubuntu-18.04-v3.5.6

# Define working directory.
WORKDIR /tmp

# Install robo3t tools.
RUN \
    add-pkg --virtual build-dependencies \
        curl \
        #build-base \
        tar \
        wget \
        libcurl3-gnutls \
        libx11-xcb1 libdbus-1-3\
        && \
    wget https://github.com/Studio3T/robomongo/releases/download/v1.4.3/robo3t-1.4.3-linux-x86_64-48f7dfd.tar.gz  && \
    tar -xvzf robo3t-1.4.3-linux-x86_64-48f7dfd.tar.gz && \
    mkdir -p /robo3t && \
    cp -r robo3t-1.4.3-linux-x86_64-48f7dfd/* /robo3t/ && \
    mkdir -p /tmp/run/user/app && \
    chmod 700 /tmp/run/user/app

COPY startapp.sh /startapp.sh

# Install extra packages.
RUN \
    add-pkg \
        desktop-file-utils \
        adwaita-icon-theme \
        ttf-dejavu \
        #ffmpeg-libs \
        # The following package is used to send key presses to the X process.
        xdotool

# Set environment variables.
ENV APP_NAME="Robo3T - Docker"
ENV QT_DEBUG_PLUGINS=1

# Define mountable directories.
VOLUME ["/config"]

# Metadata.
LABEL \
      org.label-schema.name="robo3t" \
      org.label-schema.description="Docker container for Robo3T"
