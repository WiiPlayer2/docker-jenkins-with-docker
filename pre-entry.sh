#!/bin/bash
sudo groupmod -g $1 docker
sudo usermod -a -G docker jenkins
su -c '/sbin/tini -- /usr/local/bin/jenkins.sh' - jenkins
