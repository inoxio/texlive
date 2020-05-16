FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install --no-install-recommends \
        ca-certificates \
        curl \
        libfontconfig \
        perl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install TexLive with scheme-basic
RUN mkdir /install-tl-unx \
    && curl --location --remote-name http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
    && tar -xvzf install-tl-unx.tar.gz --directory /install-tl-unx --strip-components=1 \
    && echo "selected_scheme scheme-basic" >> /install-tl-unx/texlive.profile \
    && /install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile \
    && rm -r /install-tl-unx install-tl-unx.tar.gz

ENV PATH="/usr/local/texlive/2020/bin/x86_64-linux:${PATH}"
ENV HOME /data

WORKDIR /data

# Install latex packages
RUN tlmgr install latexmk \
    && tlmgr install scheme-full

VOLUME ["/data"]
