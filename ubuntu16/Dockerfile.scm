FROM ubuntu_1604_curl:latest
MAINTAINER Gorav Bhootra <email@gorav.in>

# https://github.com/docker-library/buildpack-deps/blob/1845b3f918f69b4c97912b0d4d68a5658458e84f/stretch/scm/Dockerfile
# debian stretch-scm
# procps is very common in build systems, and is a reasonably small package

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    mercurial \
    openssh-client \
    subversion \
    \
    procps \
  && rm -rf /var/lib/apt/lists/*

# -----------
