ARG BUILDER_BASE=awesomeinc/jruby-yarn:9.1.17
ARG DOCKER_BASE=awesomeinc/jruby-yarn:9.1.17-alpine
FROM ${BUILDER_BASE} as builder

ARG APP=/usr/src/app
RUN mkdir -p $APP
WORKDIR $APP

COPY package.json yarn.loc* .yarnr* ./
RUN yarn

COPY Gemfile* $APP/
RUN bundle install

COPY . $APP

# Enable lint-ing once we have clean js-code so code smells cannot sneak back in
#RUN yarn lint
RUN yarn coverage

ENV JRUBY_OPTS -J-Djava.security.egd=file:/dev/./urandom
RUN rake test:coverage RAILS_ENV=test
RUN rake assets:precompile RAILS_ENV=production SECRET_KEY_BASE=unsecure

#------
FROM ${DOCKER_BASE}

ARG APP=/usr/src/app
RUN mkdir -p $APP
WORKDIR $APP

COPY Gemfile* $APP/
RUN bundle install --without test development --deployment

COPY . $APP

COPY --from=builder ${APP}/public/assets ./public/assets
COPY --from=builder ${APP}/public/coverage ./public/coverage
COPY --from=builder ${APP}/public/packs ./public/packs

# TODO
ARG VCS_REF="unknown"
ARG BUILD_DATE="unknown"
ARG DOCKER_TAG="latest"
ARG VENDOR="My Company"
ARG OWNER_REPO="owner/repository"
ARG DESCRIPTION="My Description"

LABEL author="My Company <first.last@company.com>"\
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.name="${OWNER_REPO}" \
  org.label-schema.description="${DESCRIPTION}" \
  org.label-schema.usage="https://github.com/${OWNER_REPO}/blob/master/README.md" \
  org.label-schema.url="https://hub.docker.com/r/${OWNER_REPO}" \
  org.label-schema.vcs-url="https://github.com/${OWNER_REPO}" \
  org.label-schema.vcs-ref="${VCS_REF}" \
  org.label-schema.vendor="${VENDOR}" \
  org.label-schema.version="${DOCKER_TAG}" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.docker.cmd="docker run ${OWNER_REPO}:${DOCKER_TAG}"

ENV RAILS_ENV production
ENV SECRET_KEY_BASE unsecure
ENV RAILS_SERVE_STATIC_FILES true
ENV JRUBY_OPTS -J-Djava.security.egd=file:/dev/./urandom

EXPOSE 3000

CMD ["./start.sh"]
