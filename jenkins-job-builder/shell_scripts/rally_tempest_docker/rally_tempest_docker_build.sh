#!/usr/bin/env bash
#### Remove old docker container and docker files ####
set +e
sudo docker rmi rally-tempest
set -e
rm -rf dockerfiles

git clone https://review.fuel-infra.org/fuel-infra/dockerfiles

##### Change rally version #####
sed -i 's|FROM rallyforge/rally:latest|FROM rallyforge/rally:0.6.0|g' \
       dockerfiles/rally-tempest/latest/Dockerfile

#### Build and save new docker container ####
sudo docker build -no-cache -t rally-tempest dockerfiles/rally-tempest/latest
sudo docker save -o ./dimage rally-tempest