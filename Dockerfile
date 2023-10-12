ARG agent_version=4.10-3
FROM jenkins/inbound-agent:${agent_version}-alpine-jdk11

# Elevate
USER root

ARG docker_version=23.0.6-r5
RUN apk --no-cache add -X https://dl-cdn.alpinelinux.org/alpine/v3.18/main -u alpine-keys \
  && apk add --update docker=${docker_version} --repository=https://dl-cdn.alpinelinux.org/alpine/v3.18/community \
  && rm -rf /var/lib/apt/lists/*
  
#USER jenkins
