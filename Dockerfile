################################################################################
# jenkins-build-base:1.0.0
# Date: 9/21/2015
# Docker Version: 1.8.2.0~trusty
#
# Description:
# Base build container for jenkins. Comes packaged with just git and docker.
################################################################################

FROM ubuntu:14.04
MAINTAINER Bob Killen / killen.bob@gmail.com / @mrbobbytables

ENV VERSION_DOCKER=1.8.2-0~trusty

RUN apt-get update                           \
 && apt-get -y install apt-transport-https   \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 2C52609D  \
 && echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list \
 && apt-get update                    \
 && apt-get -y install                \
    docker-engine=$VERSION_DOCKER     \
    git                               \
    openjdk-7-jre-headless            \
 && apt-get -y autoremove             \
 && apt-get -y autoclean              \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
