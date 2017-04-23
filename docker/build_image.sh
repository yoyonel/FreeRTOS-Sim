#!/usr/bin/env bash

# url: https://docs.docker.com/engine/reference/commandline/build/

DOCKERFILE=Dockerfile
IMAGE_TAG=debian

# DOCKERFILE=Dockerfile.alpine
# IMAGE_TAG=alpine

IMAGE_NAME=$USER/freertos-sim:$IMAGE_TAG

echo "IMAGE_NAME: $IMAGE_NAME"

docker build -t $IMAGE_NAME -f $DOCKERFILE .

echo "Tag to: $USER/freertos-sim:latest"
docker tag $IMAGE_NAME $USER/freertos-sim:latest