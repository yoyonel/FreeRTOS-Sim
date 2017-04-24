#!/usr/bin/env bash

# $1: Path to FreeRTOS sources (Kernel & Simulator)
# $2: Path to source project
# $3: Path to build directory

## $1: Path to workspace project (ex: /home/atty/Prog/__REALTIME__/FreeRTOS-Sim)

PATHTO_FREERTOS=$1
shift
PATHTO_PROJECT=$1
shift
PATHTO_BUILD=$1
shift

echo "PATHTO_FREERTOS: $PATHTO_FREERTOS"
echo "PATHTO_PROJECT: $PATHTO_PROJECT"
echo "PATHTO_BUILD: $PATHTO_BUILD"

mkdir -p $PATHTO_BUILD

# url: https://denibertovic.com/posts/handling-permissions-with-docker-volumes/
docker run \
	-it --rm \
	-v $(realpath $PATHTO_FREERTOS):/FreeRTOS-Sim \
	-v $(realpath $PATHTO_PROJECT):/FreeRTOS-Project \
	-v $(realpath $PATHTO_BUILD):/FreeRTOS-Build \
	-v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \
	-u $( id -u $USER ):$( id -g $USER ) \
	$USER/freertos-sim:latest \
	$@
