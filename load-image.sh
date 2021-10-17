#!/bin/bash

# This script assumes that all the docker image tar.gz files is present in the same folder as of script and it is run from the same folder

# List all the tar.gz files, we are assuming all docker images are saved in tar.gz format
docker_image=($(ls | grep .tar.gz))

# Iterate over each image and load the image on the system
for image in "${docker_image[@]}"
do
    docker load -i ${image}
done
