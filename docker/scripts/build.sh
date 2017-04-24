#!/usr/bin/env sh

set -e

# Path to find 'FreeRTOSConfig.h'
# pass from the host to container (it's a data)
export FREERTOS_CONFIG=/FreeRTOS-Sim/Project

# Go to sources directory (Kernel+Simulator for FreeRTOS linux port)
# (Host mount volume)
cd /FreeRTOS-Sim

# Link with source for (current) project
# (Host mount volume)
ln -s /FreeRTOS-Project /FreeRTOS-Sim/Project

# Go to build directory
# (Host mount volume)
cd /FreeRTOS-Build

# Configure the project with CMake (using CMakeLists.txt present in: /FreeRTOS-Sim directory)
cmake . /FreeRTOS-Sim

# Build the project
make -j

# Remove symbolic link (clean this residual file in Host mounted volume: /FreeRTOS-Sim)
rm -f /FreeRTOS-Sim/Project
