FROM        --platform=$TARGETOS/$TARGETARCH node:lts-alpine

LABEL       author="VLssu" maintainer="vlssu@vlssu.com"

LABEL       org.opencontainers.image.source="https://github.com/vlssu/yolks"
LABEL       org.opencontainers.image.licenses=MIT

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

RUN         yarn create koishi /home/container -y && cd /home/container && \
            sed -i '1 ihost: 0.0.0.0' koishi.yml && \
            yarn install \
 			&& useradd -d /home/container -m container

COPY 		./entrypoint.sh /entrypoint.sh

CMD			[ "/bin/bash", "/entrypoint.sh" ]