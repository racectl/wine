FROM debian:buster-slim
LABEL maintaner="david3d@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
RUN \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install --no-install-recommends -y wine-development && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

ENV WINEARCH=win64 \
    WINEDEBUG=-all

RUN useradd -ms /bin/bash wine
USER wine

WORKDIR /home/wine

RUN wineboot --init

CMD ["/usr/bin/wine", "--version"]
