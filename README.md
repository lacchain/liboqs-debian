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

## Copyright 2020 LACChain

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.