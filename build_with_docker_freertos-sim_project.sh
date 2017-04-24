#!/usr/bin/env bash

export FREERTOS_SIM_SRCS=docker/src/FreeRTOSv9.0.0
export FREERTOS_SIM_PROJECT=Project
export FREERTOS_SIM_BUILD_DIRECTORY=build/Project

./build_with_docker_freertos-sim.sh