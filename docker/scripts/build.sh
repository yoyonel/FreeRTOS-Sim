#!/usr/bin/env sh

set -e

export FREERTOS_CONFIG=/FreeRTOS-Sim/Project

cd /FreeRTOS-Sim

ln -s /FreeRTOS-Project /FreeRTOS-Sim/Project

cd /FreeRTOS-Build

cmake . /FreeRTOS-Sim

make -j

rm -f /FreeRTOS-Sim/Project