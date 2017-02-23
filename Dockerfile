FROM alpine:latest
MAINTAINER Josh Dvir <josh@dvir.uk>

ENV HUGO_VERSION 0.18.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit

RUN apk add --update \
    tar \
    curl \
    py-pygments \
    git \
    bash \
    && rm -rf /var/cache/apk/*

# Download and Install hugo
ADD https://github.com/spf13/hugo/releases/download/tag/v${HUGO_VERSION}/${HUGO_BINARY}.tgz /usr/local/
RUN tar xzf /usr/local/${HUGO_BINARY}.tgz -C /usr/local/bin/ \
	&& rm /usr/local/${HUGO_BINARY}.tgz