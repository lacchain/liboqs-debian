## LibOQS Debian files
This repository contains the files for generating Debian distribution packages for the [liboqs](https://github.com/open-quantum-safe/liboqs/) library

## Build
The Docker image in this repository builds the liboqs package. E.g.
```shell
$ docker build . -t liboqs_build
```
This Docker container expects the following volume:
  - **/output/**: where the resulting Debian package will be placed
```shell
$ docker run -v `pwd`/output:/output liboqs_build
```
