FROM ubuntu:18.04

LABEL maintainer "Toshiaki Inahata <darwin49@gmail.com>"

RUN set -x \
        && apt-get update \
        && apt-get upgrade -y \
        && apt-get install -y language-pack-ja \
        && locale-gen ja_JP.UTF-8 \
        && apt-get install -y wget gnupg2 software-properties-common \
        && wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - \
        && add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ \
        && apt-get update \
        && apt-get install -y adoptopenjdk-8-hotspot-jre \
        && apt-get remove -y software-properties-common wget gnupg2 \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
