#!/bin/bash

# Remove all docker containers
docker ps --all --quiet | xargs docker rm

# Remove the docker image
docker rmi crops/poky:ubuntu-18.04

# Delete the poky directory
rm -rf ./workdir/poky

# Clean the project directory
./clean.sh
