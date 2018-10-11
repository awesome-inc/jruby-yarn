# jruby-yarn

[![Build status](https://travis-ci.com/awesome-inc/jruby-yarn.svg?branch=master)](https://travis-ci.com/awesome-inc/jruby-yarn/)
[![GitHub issues](https://img.shields.io/github/issues/awesome-inc/jruby-yarn.svg "GitHub issues")](https://github.com/awesome-inc/jruby-yarn)
[![GitHub stars](https://img.shields.io/github/stars/awesome-inc/jruby-yarn.svg "GitHub stars")](https://github.com/awesome-inc/jruby-yarn)

Build image for applications using JRuby and yarn/NodeJS, e.g. Rails with webpacker.

[![dockeri.co](http://dockeri.co/image/awesomeinc/jruby-yarn)](https://hub.docker.com/r/awesomeinc/jruby-yarn/)

## Versions

Currently, the supported versions are:

+ JRuby 9.1.17
+ NodeJS 8.9.3
+ Yarn 1.3.2

The JRuby version determines the version of the Docker image.

## Usage

Basic example Dockerfile for a Rails-App using webpacker and JRuby.

```Dockerfile
FROM awesomeinc/jruby-yarn:9.1.17

ENV RAILS_ENV production
ENV NODE_ENV production

ENV APP /usr/src/app

RUN mkdir -p $APP
WORKDIR $APP

# copy Gemfile and Gemfile.lock
COPY Gemfile* $APP/

# copy vendored gems
COPY vendor/cache $APP/vendor/cache/

RUN bundle --version
RUN bundle install --local --deployment

COPY . $APP     

RUN rake assets:precompile

# JRUBY_OPTS: debug for coverage, urandom for fast integration tests
RUN export RAILS_ENV=test && \
  export JRUBY_OPTS="-Xcli.debug=true --debug -J-Djava.security.egd=file:/dev/./urandom" && \
  rake test:coverage

EXPOSE 8080

CMD rake db:migrate && rm -f /tmp/pids/server.pid && rails server -p 8080 -b 0.0.0.0

```
