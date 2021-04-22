ARG agent_version=4.6-1
FROM jenkins/inbound-agent:${agent_version}-alpine

# Elevate
USER root
# Only need to install npm, nodejs is included
ARG docker_version=20.10.6-r0
RUN apk add --update docker=${npm_version} --repository=http://dl-cdn.alpinelinux.org/alpine/v3.13/main \
  && rm -rf /var/lib/apt/lists/*
  
USER jenkins
