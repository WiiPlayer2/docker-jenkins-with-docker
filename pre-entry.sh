#!/bin/bash
sudo groupmod -g $1 docker
sudo usermod -a -G docker jenkins
/sbin/tini -- /usr/local/bin/jenkins.sh