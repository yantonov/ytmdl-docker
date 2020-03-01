help:
	@cat Makefile

DOCKER_FILE=Dockerfile
SRC?=$(shell pwd)
CONTAINER_SRC=/root/Music/ytmdl

IMAGE=yantonov/ytmdl

build:
	docker build \
		-t $(IMAGE) \
		-f $(DOCKER_FILE) .

run:
	docker run \
			-i -t \
			-v "$(SRC):$(CONTAINER_SRC)" \
			--rm \
			"$(IMAGE)" \
			"ytmdl" "$(filter-out $@,$(MAKECMDGOALS))"

ssh:
	docker run --rm -t -i -v "$(SRC):$(CONTAINER_SRC)" "$(IMAGE)" /bin/bash

stop:
	docker stop "$(shell docker ps -a --filter "ancestor=$(IMAGE)" --format '{{.ID}}' | head -n 1 || echo "")"

pull:
	docker pull "$(IMAGE)"

uninstall:
	docker image rm "$(IMAGE)"
