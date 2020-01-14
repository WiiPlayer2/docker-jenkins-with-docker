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
        software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get -y install docker-ce

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

ENV DOCKER_GID=998
COPY ./pre-entry.sh /
USER jenkins

ENTRYPOINT /pre-entry.sh ${DOCKER_GID}