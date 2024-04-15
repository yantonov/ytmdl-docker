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

EXECUTABLE=$(shell command -v docker >> /dev/null 2>&1 && echo "docker" || echo "podman")

build:
	$(EXECUTABLE) build \
		-t $(IMAGE) \
		-f $(DOCKER_FILE) .

run:
	$(EXECUTABLE) run \
			-i -t \
			--name "$(CONTAINER_NAME)" \
			-v "$(SRC):$(CONTAINER_SRC)" \
			-e SONG_DIR="$(CONTAINER_SRC)" \
			--rm \
			"$(IMAGE)" \
			"ytmdl" "--url" "$(RUN_ARGS)" "--ignore-chapters" "--skip-meta" "--ignore-errors"

ssh:
	$(EXECUTABLE) run -i -t \
			--name "$(CONTAINER_NAME)-$(shell date +%s)" \
			-v "$(SRC):$(CONTAINER_SRC)" \
			-e SONG_DIR="$(CONTAINER_SRC)" \
			--rm \
			"$(IMAGE)" \
			/bin/bash

stop:
	$(EXECUTABLE) stop "$(CONTAINER_NAME)"

pull:
	$(EXECUTABLE) pull "$(IMAGE)"

push:
	$(EXECUTABLE) push "$(IMAGE)"

uninstall:
	$(EXECUTABLE) image rm "$(IMAGE)"
