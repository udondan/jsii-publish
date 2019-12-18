SHELL := /bin/bash

IMAGE_NAME := udondan/jsii
IMAGE_VERSION := $(shell cat VERSION)

build:
	@docker build . -t ${IMAGE_NAME}:${IMAGE_VERSION} --file jsii.Dockerfile
	@docker tag ${IMAGE_NAME}:${IMAGE_VERSION} ${IMAGE_NAME}:latest

tag:
	@git tag -a "v$(IMAGE_VERSION)" -m 'Creates tag "v$(IMAGE_VERSION)"'
	@git push --tags

untag:
	@git push --delete origin "v$(IMAGE_VERSION)"
	@git tag --delete "v$(IMAGE_VERSION)"

release: tag

re-release: untag tag
