#!/bin/bash

# Get the CROPS/Poky Docker container that contains the Yocto Project dependencies
echo "------------------------------------------------------------------------------------"
echo "Pull the CROPS/Poky container"
docker pull crops/poky:ubuntu-18.04

# Clone the Yocto Poky repository, which contains BitBake and Open Embedded tools
echo "------------------------------------------------------------------------------------"
echo "Clone the Poky repository"
cd workdir
git clone git://git.yoctoproject.org/poky

# Start the CROPS/Poky container in a separate bash
echo "------------------------------------------------------------------------------------"
echo "Start the CROPS/Poky container"
xterm ./start.sh &
sleep 1

# Initialize the build environment (setup CMake and perform an initial build)
echo "------------------------------------------------------------------------------------"
echo "Initialize the Yocto Build"
docker exec -w /workdir -u pokyuser -i yocto-dev /workdir/init.sh
