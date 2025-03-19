export PROJECT_ROOT=$(shell pwd)
ifeq ($(shell uname -s),Darwin)
    export CONTAINER_HOST=host.docker.internal
else
    export CONTAINER_HOST=172.17.0.1
endif

TTY_ARG := $(shell if [ -t 0 ]; then echo "-t"; else echo ""; fi)
GO_CMD := docker run -i $(TTY_ARG) --rm \
	-v $(shell pwd):/app \
	-w /app \
	golang:1.23.4-alpine \
	sh -ec

build:
	docker compose down
	$(GO_CMD) "rm -rf build; \
		mkdir build; \
		go fmt ./... && go mod tidy; \
		GOOS=linux GOARCH=arm64 go build -o build/bootstrap ./main.go"
.PHONY: build

start:
	docker compose up --build sam
.PHONY: start

stop:
	docker compose down
.PHONY: stop

clean:
	-rm -rf build
	docker compose down --rmi all --volumes --remove-orphans
.PHONY: clean