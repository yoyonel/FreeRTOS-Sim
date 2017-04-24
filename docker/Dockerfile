# Debian image
FROM debian:latest

# Install package for build and executing FreeRTOS-Sim projects
# - g++: gcc compiler
# - cmake: tool for building project
# - libc6-dev-i386: cross-compil toolchain for i386 (32bits) target (using by FreeRTOS(-Sim))
RUN apt-get update && apt-get -y install \
		g++ \
		cmake \
		libc6-dev-i386 \
	&& rm -rf /var/lib/apt/lists/*

# Script for building application
COPY scripts/build.sh /build.sh
RUN chmod +x /build.sh

# Workdir directory
# Need to be a mount volume from host (contain sources of FreeRTOS Kernel & Simulator)
WORKDIR /FreeRTOS-Sim

# default command
CMD ["/build.sh"]
