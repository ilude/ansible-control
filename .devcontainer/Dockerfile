# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.134.1/containers/alpine/.devcontainer/base.Dockerfile
ARG VARIANT="3.12"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-alpine-${VARIANT}

ENV APP=/app
ENV HOME=/root
ENV TZ=America/Los_Angeles

RUN \
  apk add --no-cache --virtual .build-deps build-base g++ python3-dev libffi-dev openssl-dev && \
  apk add --no-cache bash ca-certificates cifs-utils curl git openssh-client python3 py3-pip ssmtp tzdata && \
  rm -rf /var/cache/apk/* && \
  ln -snf /etc/localtime /usr/share/zoneinfo/$TZ && echo $TZ > /etc/timezone && \
  mkdir -p $APP/.devcontainer  && \
  mkdir -p $HOME/.ssh && \
  ssh-keyscan -H github.com >> $HOME/.ssh/known_hosts && \
  ssh-keyscan -H bitbucket.org >> $HOME/.ssh/known_hosts && \
  update-ca-certificates 

COPY /home/* $HOME/
COPY /etc/gitconfig /etc/gitconfig
COPY /etc/profile.d/*.sh /etc/profile.d/
