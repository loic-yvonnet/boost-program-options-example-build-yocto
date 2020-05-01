# Boost Program Options example built with the Yocto Project

## Context

I did not find a complete [Yocto](https://www.yoctoproject.org/) tutorial that shows how to use [BitBake](https://github.com/openembedded/bitbake), [CMake](https://cmake.org) and [Docker](https://www.docker.com) to cross-compile a simple C++17 project with a dependency on Boost and run it on [QEMU](https://www.qemu.org) on the ARM platform.

The Yocto Project looks fantastic, and it is not trivial to get started. This repository shows a toy project to quickly get started with a simple C++ application.

## Summary

This repository contains an [application layer](./workdir/project/meta-yoctoboost) with a [recipe](./workdir/project/meta-yoctoboost/recipes-yoctoboost/yoctoboost/recipes-yoctoboost.bb) to build the content of [the boost-program-options-example-dev repository](https://github.com/loic-yvonnet/boost-program-options-example-dev). The [target image](./workdir/project/conf/local.conf) is the ARM64 architecture defined to run on top of QEMU. It uses the [CROPS/Poky](https://hub.docker.com/r/crops/poky) Docker container and the [Poky](https://git.yoctoproject.org) repository.

## Build and run

The following scripts are available to build and run the solution:
* **init.sh**: It downloads the CROPS/Poky Docker container, clones the Poky git repository, and starts the CROPS/Poky container. Finally, it bakes the recipe and image. In other words, it downloads all the build tools (e.g. GCC, CMake, etc.) and dependencies (e.g. Docker), it clones the the boost-program-options-example-dev repository](https://github.com/loic-yvonnet/boost-program-options-example-dev), and builds it in the ARM64 image. You can run *run.sh* right after *init.sh*.
* **destroy.sh**: It deletes the CROPS/Poky Docker container.
* **start.sh**: It starts the CROPS/Poky Docker container.
* **compile.sh**: It bakes the recipe and image.
* **run.sh**: It runs QEMU with the built image. You may login with "root". The built application executable is `/usr/bin/yoctoboost`.
* **stop.sh**: It stops the CROPS/Poky Docker container.
