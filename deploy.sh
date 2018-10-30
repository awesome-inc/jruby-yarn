#!/bin/sh
VCS_REF=`git rev-parse --short HEAD`
BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`
docker-compose build
echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin
docker-compose push

#IMAGE_NAME=awesomeinc/jruby-yarn:${DOCKER_TAG}
#docker build --build-arg VCS_REF=`git rev-parse --short HEAD`\
# --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"`\
# --build-arg DOCKER_TAG="${DOCKER_TAG}"\
# -t ${IMAGE_NAME} .
#echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin
#docker push ${IMAGE_NAME}