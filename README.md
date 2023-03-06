# robo3t-docker
Robo 3T (former Robomongo, https://robomongo.org/) as a docker container accessible via web

## Motivation
This was built to manage a MongoDB instance that is running on a remote site. For example when having a remote kubernetes cluster and mongo-cli is not sufficient for your needs.

## Usage
This container is to be run in the same environment as the MongoDB you want to administrate.
The container exposes a web site on port 5800 and a VNC entpoint on port 5900.
Please consider both of this options as unsafe and use it only via VPN or with a reverse proxy that offers the website via HTTPS.
