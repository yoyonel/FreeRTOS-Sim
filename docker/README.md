# FreeRTOS-Sim + Docker

## Debian

Fonctionne bien.

### Compilation de l'image Docker

```sh
┏ ✓    atty@debian   ~/Prog/__RE…ME__/Free…-Sim/docker     master                                                                                   0.33   2.87G    00:12:27 
┗ ./build_image.sh    
IMAGE_NAME: atty/freertos-sim:debian
Sending build context to Docker daemon  13.82kB
Step 1/6 : FROM debian:latest
 ---> 55cc17a983d7
Step 2/6 : RUN apt-get update && apt-get -y install             g++             cmake           git                     libc6-dev-i386  && rm -rf /var/lib/apt/lists/*
 ---> Using cache
 ---> e3beb88b7f2b
Step 3/6 : COPY scripts/build.sh /build.sh
 ---> Using cache
 ---> 3719c8be253b
Step 4/6 : RUN chmod +x /build.sh
 ---> Using cache
 ---> 67001971045f
Step 5/6 : WORKDIR /FreeRTOS-Sim
 ---> Using cache
 ---> dbc2714b1238
Step 6/6 : CMD /build.sh
 ---> Using cache
 ---> 3e6d9cd2112b
Successfully built 3e6d9cd2112b
Tag to: atty/freertos-sim:latest
```
```sh
┏ ✓    atty@debian   ~/Prog/__RE…ME__/Free…-Sim/docker     master                                                                                   0.41   3.03G    00:13:56 
┗ docker images | grep rtos          
atty/freertos-sim                          debian                                                             3e6d9cd2112b        6 hours ago         456MB
atty/freertos-sim                          latest                                                             3e6d9cd2112b        6 hours ago         456MB
```
### Exploitation - Execution

Format du binaire généré:
```bash
┏ ✓    atty@debian   ~/Prog/__RE…ME__/FreeRTOS-Sim     master                                                                                        0.42   2.92G    00:11:30 
┗ file build/FreeRTOS-Sim
build/FreeRTOS-Sim: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=3a73686fa15c80df3716359dfc663c40747a4b30, not stripped
```

Exécution directement depuis l'host (x86_64):
```bash
┏ ✓    atty@debian   ~/Prog/__RE…ME__/FreeRTOS-Sim     master                                                                                        0.39   2.92G    00:11:33 
┗ ./build/FreeRTOS-Sim
Running as PID: 4834
Timer Resolution for Run TimeStats is 100 ticks per second.
This is task 1 - 100
This is task 1 - 200
This is task 1 - 300
This is task 1 - 400
This is task 1 - 500
This is task 2 - 500
This is task 1 - 600
This is task 1 - 700
```

## Alpine

Plus compliqué car il semble manquer une lib avec la compilation du gcc par défaut sous alpine:
```
According to gcc -v on alpine gcc is compiled without multilib support:

--disable-multilib

While multilib is enabled on debian:

--with-multilib-list=m32,m64,mx32 --enable-multilib

Multilib support is required for the -m32 to work reliable. Therefore the default compiler on alpine is really not suited for compiling 32bit binaries.
```
=> [http://stackoverflow.com/questions/40539592/how-to-compile-a-32bit-hello-world-on-alpine](http://stackoverflow.com/questions/40539592/how-to-compile-a-32bit-hello-world-on-alpine)

... Faudrait peut être recompiler gcc sous alpine ...
