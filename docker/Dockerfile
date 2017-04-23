FROM debian:latest

#
RUN apt-get update && apt-get -y install \
		g++ \
		cmake \
		git	\
		libc6-dev-i386 \
	&& rm -rf /var/lib/apt/lists/*

COPY scripts/build.sh /build.sh
RUN chmod +x /build.sh

WORKDIR /FreeRTOS-Sim

CMD ["/build.sh"]