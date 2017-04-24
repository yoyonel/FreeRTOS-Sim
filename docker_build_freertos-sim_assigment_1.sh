#!/usr/bin/env bash

./docker/run.sh docker/src Assigments/Assigment_1 build/Assigment_1

# remove symbolic link
if[ -f Assigments/Assigment_1/FreeRTOS-Project ]; then
	rm Assigments/Assigment_1/FreeRTOS-Project
fi