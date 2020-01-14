FROM jenkins/jenkins:latest

LABEL maintainer="WiiPlayer2"

USER root
# COPY /usr/bin/docker /usr/bin/docker
RUN apt-get update \
      && apt-get upgrade -y \
      && apt-get install -y sudo libltdl-dev \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins