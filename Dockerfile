# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM openjdk:17-jdk-alpine

MAINTAINER VLssu, <vlssu@vlssu.com>

RUN apk add --no-cache --update curl ca-certificates openssl git tar python3 python3-dev python3-pip bash sqlite fontconfig \
    && adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]