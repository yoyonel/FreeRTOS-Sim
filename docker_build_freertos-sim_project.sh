#!/usr/bin/env bash

./docker/run.sh docker/src Project/ build/Project

# # remove symbolic link
# if [ -e Project/FreeRTOS-Project ]; then
# 	rm Project/FreeRTOS-Project
# fi
