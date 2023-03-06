#
# studio3t-docker Dockerfile
#

# Pull base image.
FROM jlesage/baseimage-gui:alpine-3.17-v4.4.0

# Define working directory.
WORKDIR /tmp

# Install studio3t tools.
RUN \
    add-pkg --virtual build-dependencies \
        curl \
        tar \
        wget \
        libcurl3-gnutls \
        libx11-xcb1 libdbus-1-3\
        && \
    wget https://download.studio3t.com/studio-3t/linux/2023.1.1/studio-3t-linux-x64.tar.gz  && \
    tar -xvzf studio-3t-linux-x64.tar.gz && \
    mkdir -p /studio3t && \
    cp -r studio-3t-linux-x64/* /studio3t/ && \
    mkdir -p /tmp/run/user/app && \
    chmod 700 /tmp/run/user/app

COPY startapp.sh /startapp.sh

# Install extra packages.
RUN \
    add-pkg \
        desktop-file-utils \
        adwaita-icon-theme \
        ttf-dejavu \
        # The following package is used to send key presses to the X process.
        xdotool

# Set environment variables.
ENV APP_NAME="Studio 3T - Docker"
ENV QT_DEBUG_PLUGINS=0

# Define mountable directories.
VOLUME ["/config"]

EXPOSE 5800
EXPOSE 5900

# Metadata.
LABEL \
      org.label-schema.name="studio3t" \
      org.label-schema.description="Docker container for Studio 3T"
