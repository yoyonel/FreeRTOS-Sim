#!/usr/bin/env sh

cd /FreeRTOS-Sim

mkdir -p build

cd build

cmake . ../.

make -j