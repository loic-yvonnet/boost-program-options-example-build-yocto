#!/bin/bash

# Initialize the build directory, environment variable, and the PATH
echo "---------------------------------------------------------------------------------------------"
echo "Initialize the build directory"
source poky/oe-init-build-env project

# Build a minimal embedded system that can be emulated thanks to QEMU
echo "---------------------------------------------------------------------------------------------"
echo "Initial build"
bitbake core-image-minimal

# Build the CMake toolchain for the target embedded OS
echo "---------------------------------------------------------------------------------------------"
echo "Build the SDK with CMake"
bitbake core-image-minimal -c populate_sdk

# Build the C++ program for the target embedded OS
echo "---------------------------------------------------------------------------------------------"
echo "Build our recipe"
bitbake recipes-yoctoboost

# Add our package to the target embedded OS image
echo "---------------------------------------------------------------------------------------------"
echo "Deploy the Yocto Boost executable"
bitbake core-image-minimal
