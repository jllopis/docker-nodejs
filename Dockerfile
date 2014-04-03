# VERSION         v0.1.0
# DOCKER-VERSION  0.9.1
# NODEJS-VERSION  0.10.26
# AUTHOR:         Joan Llopis <jllopis@acb.es>
# DESCRIPTION:    Image with ACB Observer application and dependencies
# TO_BUILD:       docker build -rm -t docker.acb.info:5000/observer:latest .
# TO_RUN:         docker run -p 3000 -e "OBSERVER_RAILS_ENV=production" docker.acb.info:5000/observer:latest

FROM ubuntu:12.04

MAINTAINER Joan Llopis <jllopisg@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen es_ES.UTF-8
ENV LANG es_ES.UTF-8
ENV LC_ALL es_ES.UTF-8
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# hopefully temporary work-around of http://git.io/Ke_Meg#1724
RUN apt-mark hold initscripts udev plymouth mountall

# Install dependencies
# Add PPA for node.js
RUN echo "deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu saucy main" >> /etc/apt/sources.list.d/ppa_chris_lea_nodejs_saucy.list; \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key C7917B12

# System upgrade
RUN apt-get -qq update && \
    apt-get -qqy upgrade --no-install-recommends

# Install redis-commander
RUN apt-get -qy install nodejs=0.10.26-1chl1~saucy1
