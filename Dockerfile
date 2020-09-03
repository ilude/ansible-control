FROM alpine:3.12
LABEL maintainer="Mike Glenn <mglenn@ilude.com>"
LABEL project=ansible-control

ENV APP=/app
ENV HOME=/root
ENV TZ=America/Los_Angeles

RUN \
  apk add --no-cache --virtual .build-deps build-base g++ python3-dev libffi-dev openssl-dev && \
  apk add --no-cache   bash ca-certificates cifs-utils curl git openssh-client python3 py3-pip ssmtp tzdata && \
  rm -rf /var/cache/apk/* && \
  ln -snf /etc/localtime /usr/share/zoneinfo/$TZ && echo $TZ > /etc/timezone && \
  mkdir -p $HOME/.ssh && touch ~/.ssh/id_ed25519 && \
  ssh-keyscan -H github.com >> $HOME/.ssh/known_hosts && \
  ssh-keyscan -H bitbucket.org >> $HOME/.ssh/known_hosts && \
  chmod -R 600 $HOME/.ssh && \
  update-ca-certificates 

COPY containers/etc/profile.d/*.sh /etc/profile.d/
COPY containers/etc/gitconfig /etc/gitconfig
COPY containers/usr/local/bin/*.sh /usr/local/bin/
COPY requirements.txt $APP/requirements.txt

WORKDIR $APP

RUN pip install -r requirements.txt && pip cache purge

ENTRYPOINT  ["docker-entrypoint.sh"]
CMD ["bash", "-l"]