## Base image to use
FROM alpine

## Maintainer info
MAINTAINER razorgirl <https://github.com/razorgirl>

## Update base image and install prerequisites
RUN apk add --update git python && \
  rm -rf /var/cache/apk/*

## Install Couchpotato
RUN mkdir /opt && \
  cd /opt && \
  git clone https://github.com/RuudBurger/CouchPotatoServer.git

## Expose port
EXPOSE 5050

## Set working directory
WORKDIR /opt

## Run Couchpotato
ENTRYPOINT ["python", "CouchPotatoServer/CouchPotato.py"]
