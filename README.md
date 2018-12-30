# jruby-yarn

[![Docker build](https://img.shields.io/docker/build/awesomeinc/jruby-yarn.svg?logo=docker)](https://hub.docker.com/r/awesomeinc/jruby-yarn/builds/)
[![Docker automated](https://img.shields.io/docker/automated/awesomeinc/jruby-yarn.svg?logo=docker)](https://hub.docker.com/r/awesomeinc/jruby-yarn/)
[![Docker stars](https://img.shields.io/docker/stars/awesomeinc/jruby-yarn.svg?logo=docker)](https://hub.docker.com/r/awesomeinc/jruby-yarn/)
[![Docker pulls](https://img.shields.io/docker/pulls/awesomeinc/jruby-yarn.svg?logo=docker)](https://hub.docker.com/r/awesomeinc/jruby-yarn/)

<!--
[![Build status] Not migrated yet(https://img.shields.io/travis/awesome-inc/jruby-yarn.svg?logo=travis)](https://travis-ci.com/awesome-inc/jruby-yarn/) -->
[![Build status](https://travis-ci.com/awesome-inc/jruby-yarn.svg?branch=master)](https://travis-ci.com/awesome-inc/jruby-yarn/)
[![GitHub issues](https://img.shields.io/github/issues/awesome-inc/jruby-yarn.svg?logo=github "GitHub issues")](https://github.com/awesome-inc/jruby-yarn)
[![GitHub stars](https://img.shields.io/github/stars/awesome-inc/jruby-yarn.svg?logo=github "GitHub stars")](https://github.com/awesome-inc/jruby-yarn)


Build image for applications using JRuby and yarn/NodeJS, e.g. Rails with webpacker.

[![dockeri.co](http://dockeri.co/image/awesomeinc/jruby-yarn)](https://hub.docker.com/r/awesomeinc/jruby-yarn/)

## Versions

Currently, the supported versions are:

- JRuby 9.1.17
- NodeJS 8.9.3
- Yarn 1.3.2

The JRuby version determines the version of the Docker image.

## Usage

Basic example Dockerfile for a Rails-App using webpacker and JRuby in [app/Dockerfile](app/Dockerfile).
