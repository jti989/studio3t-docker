# studio3t-docker
Studio 3T (former Robo 3T, https://studio3t.com/) as a docker container accessible via web.
This is a direct successor of the robo3t-docker (jti989/robo3t-docker).

## Motivation
This was built to manage a MongoDB instance that is running on a remote site. For example when having a remote kubernetes cluster and mongo-cli is not sufficient for your needs.

## Usage
This container is to be run in the same environment as the MongoDB you want to administrate.
The container exposes a web site on port 5800 and a VNC endpoint on port 5900.
Please consider both of this options as unsafe and use it only via VPN or with a reverse proxy that offers the website via HTTPS.
