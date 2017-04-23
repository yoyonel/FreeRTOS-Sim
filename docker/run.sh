#!/usr/bin/env bash

# $1: Path to workspace project (ex: /home/atty/Prog/__REALTIME__/FreeRTOS-Sim)

# url: https://denibertovic.com/posts/handling-permissions-with-docker-volumes/
docker run \
	-it --rm \
	-v $1:/FreeRTOS-Sim \
	-v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \
	-u $( id -u $USER ):$( id -g $USER ) \
	$USER/freertos-sim:latest
