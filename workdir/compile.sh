#!/bin/bash

source ./poky/oe-init-build-env project > /dev/null
bitbake core-image-minimal
