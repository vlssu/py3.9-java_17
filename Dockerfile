# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM ghcr.io/pterodactyl/yolks:python_3.9

LABEL author="ValiantShishu" maintainer="vlssu@vlssu.com"

RUN apk add --update --no-cache cmake make ca-certificates curl ffmpeg g++ gcc git openssl sqlite tar tzdata \
    && adduser -D -h /home/container container
RUN apk add openjdk-17-jdk
RUN pip install mcdreforged -i https://pypi.tuna.tsinghua.edu.cn/simple
USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]