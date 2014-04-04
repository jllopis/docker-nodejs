# VERSION         v0.1.0
# DOCKER-VERSION  0.9.1
# NODEJS-VERSION  0.10.26
# AUTHOR:         Joan Llopis <jllopis@acb.es>
# DESCRIPTION:    Image with nodejs and dependencies
# TO_BUILD:       docker build -rm -t jllopis/nodejs:{version} .
# TO_RUN:         Not to be run

FROM ubuntu:12.04

MAINTAINER Joan Llopis <jllopisg@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen es_ES.UTF-8
ENV LANG es_ES.UTF-8
ENV LC_ALL es_ES.UTF-8
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# hopefully temporary work-around of http://git.io/Ke_Meg#1724
RUN apt-mark hold initscripts udev plymouth mountall

# System upgrade
RUN apt-get -qq update && \
    apt-get -qqy upgrade --no-install-recommends

# Install dependencies
RUN apt-get -qy install git mercurial curl --no-install-recommends

# Install nodejs
RUN curl http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz | tar -C /usr/local/ --strip-components=1 -zxv

