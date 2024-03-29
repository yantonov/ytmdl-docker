help:
	@cat Makefile

DOCKER_FILE=Dockerfile
SRC?=$(HOME)/Downloads
CONTAINER_SRC=/root/Music/ytmdl

IMAGE=yantonov/ytmdl
CONTAINER_NAME?=$(shell echo "$(IMAGE)_$(shell date +%s)" | tr '/' '_')

ifeq (run, $(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

build:
	docker build \
		-t $(IMAGE) \
		-f $(DOCKER_FILE) .

run:
	docker run \
			-i -t \
			--name "$(CONTAINER_NAME)" \
			-v "$(SRC):$(CONTAINER_SRC)" \
			-e SONG_DIR="$(CONTAINER_SRC)" \
			--rm \
			"$(IMAGE)" \
			"ytmdl" "--url" "$(RUN_ARGS)" "--ignore-chapters" "--skip-meta" "--ignore-errors"

ssh:
	docker run -i -t \
			--name "$(CONTAINER_NAME)-$(shell date +%s)" \
			-v "$(SRC):$(CONTAINER_SRC)" \
			-e SONG_DIR="$(CONTAINER_SRC)" \
			--rm \
			"$(IMAGE)" \
			/bin/bash

stop:
	docker stop "$(CONTAINER_NAME)"

pull:
	docker pull "$(IMAGE)"

push:
	docker push "$(IMAGE)"

uninstall:
	docker image rm "$(IMAGE)"
