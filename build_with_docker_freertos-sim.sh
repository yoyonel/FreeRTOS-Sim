#!/usr/bin/env bash

./docker/run.sh \
	$FREERTOS_SIM_SRCS \
	$FREERTOS_SIM_PROJECT \
	$FREERTOS_SIM_BUILD_DIRECTORY

# remove symbolic link
# url: http://stackoverflow.com/questions/5767062/how-to-check-if-symlink-exists
if [ -L ${FREERTOS_SIM_PROJECT}/FreeRTOS-Project ] ; then
	rm $PATH_SL
fi