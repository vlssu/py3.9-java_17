FROM        --platform=$TARGETOS/$TARGETARCH node:lts-alpine

LABEL       author="VLssu" maintainer="vlssu@vlssu.com"

LABEL       org.opencontainers.image.source="https://github.com/vlssu/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apk add --no-cache chromium nss freetype harfbuzz ca-certificates ttf-freefont font-noto-cjk tzdata
RUN         adduser -D /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

RUN         yarn create koishi . -y && \
            sed -i '1 ihost: 0.0.0.0' koishi.yml && \
            yarn install

COPY        ./../entrypoint.sh /entrypoint.sh

CMD			[ "/bin/bash", "/entrypoint.sh" ]