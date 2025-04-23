FROM ubuntu_1804_curl:latest
LABEL maintainer="Gorav Bhootra <email@gorav.in>"

# https://github.com/docker-library/buildpack-deps/blob/master/bionic/scm/Dockerfile

# procps is very common in build systems, and is a reasonably small package
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    openssh-client \
    subversion \
    \
    procps \
&& rm -rf /var/lib/apt/lists/*
