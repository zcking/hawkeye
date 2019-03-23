CMD ?= sh
ENV_FILE ?= .env
IMAGE := zcking/hawkeye

build:
	-docker build -t ${IMAGE} .

run:
	-docker run --rm --env-file=${ENV_FILE} -v ${HOME}/.aws:/root/.aws -it ${IMAGE} ${CMD}

.PHONY: build run