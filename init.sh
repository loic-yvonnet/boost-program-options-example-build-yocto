#!/bin/bash

# Check whether docker is installed
which docker > /dev/null 2>&1
if [ $? != 0 ]
then
    echo Please install Docker.
    exit 1
fi

# Check whether git is installed
which git > /dev/null 2>&1
if [ $? != 0 ]
then
    echo Please install Git.
    exit 1
fi

# Get the CROPS/Poky Docker container that contains the Yocto Project dependencies
echo "------------------------------------------------------------------------------------"
echo "Pull the CROPS/Poky container"
docker pull crops/poky:ubuntu-18.04

# Clone the Yocto Poky repository, which contains BitBake and Open Embedded tools
echo "------------------------------------------------------------------------------------"
echo "Clone the Poky repository"
cd workdir
if [ -d poky ]
then
    echo "Already cloned"
else
    git clone git://git.yoctoproject.org/poky
fi
cd ..

# Start the CROPS/Poky container in a separate bash
echo "------------------------------------------------------------------------------------"
echo "Start the CROPS/Poky container"
if [[ "$(docker ps --filter="name=yocto-dev" -q 2> /dev/null)" == "" ]]
then
    # Check whether xterm is available
    which xterm > /dev/null 2>&1
    if [ $? != 0 ]
    then
        echo "Please run ./start.sh from another terminal and re-run ./init.sh"
        exit 1
    else
        xterm ./start.sh &
        sleep 3
    fi
else
    echo "Already started"
fi

# Initialize the build environment (setup CMake and perform an initial build)
echo "------------------------------------------------------------------------------------"
echo "Initialize the Yocto Build"
docker exec -w /workdir -u pokyuser -i yocto-dev /workdir/init.sh
