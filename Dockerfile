FROM jenkins/jenkins:latest

LABEL maintainer="WiiPlayer2"

USER root
# Install docker client
RUN apt-get update && \
    apt-get -y install \
        sudo \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common \
        gosu && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
    "deb https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get -y install docker-ce

COPY entrypoint.sh /entrypoint.sh
COPY fix-perms.sh /fix-perms.sh
RUN usermod -a -G docker jenkins

ENTRYPOINT ["/entrypoint.sh", "/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
