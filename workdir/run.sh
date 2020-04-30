#!/bin/bash

echo qemuarm64 login is root, no password required
echo run ./stop.sh from the host in another terminal window to stop the emulator
sleep 1
source ./poky/oe-init-build-env project > /dev/null
runqemu qemuarm64 core-image-minimal qemuparams="-m 256" slirp nographic
