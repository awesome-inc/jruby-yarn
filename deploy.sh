#!/bin/sh
VCS_REF=`git rev-parse --short HEAD`
BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
docker-compose build
if [ "x$TRAVIS_TAG" == "x" ]; then exit; fi
echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin
docker-compose push
