ARG JRUBY_VERSION=9.1.17
FROM jruby:${JRUBY_VERSION}-alpine

# cf.:
# - https://docs.docker.com/docker-cloud/builds/advanced/#environment-variables-for-building-and-testing
# - https://medium.com/microscaling-systems/labelling-automated-builds-on-docker-hub-f3d073fb8e1
# - https://docs.docker.com/docker-cloud/builds/advanced/#override-build-test-or-push-commands
ARG BUILD_DATE
ARG VCS_REF
ARG DOCKER_TAG

# cf.: http://label-schema.org/rc1/
LABEL author="Awesome Incremented <marcel.koertgen@gmail.com>"\
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.name="awesomeinc/jruby-yarn" \
    org.label-schema.description="JRuby base image with Yarn for use with webpacker." \
    org.label-schema.usage="https://github.com/awesome-inc/jruby-yarn/blob/master/README.md" \
    org.label-schema.url="https://hub.docker.com/r/awesomeinc/jruby-yarn" \
    org.label-schema.vcs-url="https://github.com/awesome-inc/jruby-yarn" \
    org.label-schema.vcs-ref="${VCS_REF}" \
    org.label-schema.vendor="Awesome Inc" \
    org.label-schema.version="${DOCKER_TAG}" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.docker.cmd="docker run awesomeinc/jruby-yarn:${DOCKER_TAG}"

RUN apk add --no-cache nodejs yarn curl

ARG SASS_VERSION=v4.9.4
ENV SASS_VERSION ${SASS_VERSION}/linux_musl-x64-57
ENV SASS_BINARY_DIR /usr/share/node-sass/${SASS_VERSION}
ENV SASS_BINARY_PATH ${SASS_BINARY_DIR}/binding.node
RUN mkdir -p ${SASS_BINARY_DIR} &&\
    curl -o ${SASS_BINARY_PATH} -OJL https://github.com/sass/node-sass/releases/download/${SASS_VERSION}_binding.node
