CMD ?= sh
ENV_FILE ?= .env

build:
	-docker build -t hawkeye .

run:
	-docker run --rm --env-file=${ENV_FILE} -v ${HOME}/.aws:/root/.aws -it hawkeye ${CMD}

.PHONY: build run