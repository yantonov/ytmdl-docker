help:
	@cat Makefile

DOCKER_FILE=Dockerfile
SRC?=$(shell pwd)
CONTAINER_SRC=/root/Music/ytmdl
SONG?=hello

IMAGE=yantonov/ytmdl
CONTAINER_NAME?=$(shell echo "$(IMAGE)" | tr '/' '_')

build:
	docker build \
		-t $(IMAGE) \
		-f $(DOCKER_FILE) .

run:
	docker run \
			-i -t \
			--name "$(CONTAINER_NAME)" \
			-v "$(SRC):$(CONTAINER_SRC)" \
			--rm \
			"$(IMAGE)" \
			"ytmdl" "$(SONG)"

ssh:
	docker run --rm -t -i -v "$(SRC):$(CONTAINER_SRC)" "$(IMAGE)" /bin/bash

stop:
	docker stop "$(CONTAINER_NAME)"

pull:
	docker pull "$(IMAGE)"

uninstall:
	docker image rm "$(IMAGE)"
