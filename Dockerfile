ARG agent_version=4.6-1
FROM jenkins/inbound-agent:${agent_version}-alpine

# Elevate
USER root

ARG docker_version=20.10.6-r0
RUN apk add --update docker=${docker_version} --repository=http://dl-cdn.alpinelinux.org/alpine/latest-stable/community \
  && rm -rf /var/lib/apt/lists/*
  
#USER jenkins
