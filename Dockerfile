FROM alpine:latest
MAINTAINER Josh Dvir <josh@dvir.uk>

ENV HUGO_VERSION 0.27
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit

RUN apk add --update \
    tar \
    curl \
    py-pygments \
    git \
    bash \
    && rm -rf /var/cache/apk/*

# Download and Install hugo
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_BINARY}_Linux-64bit.tar.gz /usr/local/

RUN tar xzf /usr/local/${HUGO_BINARY}.tar.gz -C /usr/local/bin/ \
	&& rm /usr/local/${HUGO_BINARY}.tar.gz \
  && mv /usr/local/bin/hugo*/hugo* /usr/local/bin/hugo