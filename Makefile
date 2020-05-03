IMAGE_NAME ?= okgolove/prerender
CIRCLE_TAG ?= dev

.PHONY: all build

build:
	docker build -t $(IMAGE_NAME):$(CIRCLE_TAG) .

all: build
	@echo 'Finished ...'
