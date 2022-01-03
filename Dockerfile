# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM openjdk:17-jdk-alpine

LABEL author="ValiantShishu" maintainer="vlssu@vlssu.com"

RUN apk add --no-cache --update curl ca-certificates openssl gcc git tar bash sqlite fontconfig \
    && adduser --disabled-password --home /home/container container
RUN apk add --no-cache python3 python3-dev
RUN apk add --no-cache py3-pip
RUN pip3 install mcdreforged -i https://pypi.tuna.tsinghua.edu.cn/simple
USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]