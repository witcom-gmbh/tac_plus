VERSION?=202205051820
DOCKER_HUB_NAME?='noc/tac_plus'

.PHONY: alpine tag

all: alpine tag

alpine:
	docker build -t tac_plus:alpine \
		--build-arg SRC_VERSION=$(VERSION) \
		-f Dockerfile.alpine .

tag:
	docker tag tac_plus:alpine $(DOCKER_HUB_NAME):alpine-latest
	docker tag tac_plus:alpine $(DOCKER_HUB_NAME):alpine-$(VERSION)
