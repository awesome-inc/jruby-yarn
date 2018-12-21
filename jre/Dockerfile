ARG JRUBY_VERSION=9.1.17
FROM jruby:${JRUBY_VERSION}

# Install node 10.x, cf.: https://websiteforstudents.com/install-the-latest-node-js-and-nmp-packages-on-ubuntu-16-04-18-04-lts/
# Install yarn 1.10, cf.: https://yarnpkg.com/lang/en/docs/install/#debian-stable
RUN (curl -sL https://deb.nodesource.com/setup_8.x | bash -) &&\
  (curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -) &&\
  echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list &&\
  apt-get update && apt-get install -y --no-install-recommends nodejs yarn &&\
  rm -rf /var/lib/apt/lists/*

ARG SASS_VERSION=v4.9.4
ENV SASS_VERSION ${SASS_VERSION}/linux-x64-57
ENV SASS_BINARY_DIR /usr/share/node-sass/${SASS_VERSION}
ENV SASS_BINARY_PATH ${SASS_BINARY_DIR}/binding.node
RUN mkdir -p ${SASS_BINARY_DIR} &&\
  curl -o ${SASS_BINARY_PATH} -OJL https://github.com/sass/node-sass/releases/download/${SASS_VERSION}_binding.node

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
