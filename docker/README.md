# FreeRTOS-Sim + Docker

## Debian

Fonctionne bien. Pas de problème !

## Alpine

Plus compliqué car il semble manquer une lib avec la compilation du gcc par défaut sous alpine:
```wikipedia
According to gcc -v on alpine gcc is compiled without multilib support:

--disable-multilib

While multilib is enabled on debian:

--with-multilib-list=m32,m64,mx32 --enable-multilib

Multilib support is required for the -m32 to work reliable. Therefore the default compiler on alpine is really not suited for compiling 32bit binaries.
```
=> [http://stackoverflow.com/questions/40539592/how-to-compile-a-32bit-hello-world-on-alpine](http://stackoverflow.com/questions/40539592/how-to-compile-a-32bit-hello-world-on-alpine)

... Faudrait peut être recompiler gcc sous alpine ...
