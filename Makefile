SHELL := /bin/bash

IMAGE_NAME := udondan/jsii
IMAGE_VERSION := $(shell cat VERSION)

build:
	@docker build . -t ${IMAGE_NAME}:${IMAGE_VERSION} --file jsii.Dockerfile
	@docker tag ${IMAGE_NAME}:${IMAGE_VERSION} ${IMAGE_NAME}:latest
