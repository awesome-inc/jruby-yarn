# jruby-yarn

[![Build status](https://travis-ci.com/awesome-inc/jruby-yarn.svg?branch=master)](https://travis-ci.com/awesome-inc/jruby-yarn/)
[![GitHub issues](https://img.shields.io/github/issues/awesome-inc/jruby-yarn.svg 'GitHub issues')](https://github.com/awesome-inc/jruby-yarn)
[![GitHub stars](https://img.shields.io/github/stars/awesome-inc/jruby-yarn.svg 'GitHub stars')](https://github.com/awesome-inc/jruby-yarn)

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
