PUID := $(shell id -u)
PGID := $(shell id -g)
SSH_PRIVATE_KEY:=$(shell cat ~/.ssh/id_ed25519)

export PUID
export PGID
export SSH_PRIVATE_KEY

run: build
	docker-compose run --rm ansible-control bash

build:
	docker-compose build 

echo:
	@echo SSH_PRIVATE_KEY=${SSH_PRIVATE_KEY}