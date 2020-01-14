#!/bin/bash
sudo usermod -a -G $1 jenkins
/sbin/tini -- /usr/local/bin/jenkins.sh