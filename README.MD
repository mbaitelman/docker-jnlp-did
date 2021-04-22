# inboud-agent-did

! This is still a work in progress. It works as expected though there are changes that should still be made.!

## About

This container is meant to work with the [Amazon ECS plugin for Jenkins](https://plugins.jenkins.io/amazon-ecs/). It can be used to run docker commands (Dockerfile etc) while inside of an ECS task. 

### Docker Hub
This image is available from [Docker Hub](https://hub.docker.com/r/mbaitelman/inbound-agent-did).

## Usage

To use this image run a Jenkins job with the agent set to ECS, you will need to mount the docker socket to the container as well. 

```groovy
agent {
    ecs {
        cloud "aws-ecs"
        cpu 1
        image 'mbaitelman/inbound-agent-did:latest'
        launchType 'EC2'
        memoryReservation 5
        remoteFSRoot '/home/jenkins'
        mountPoints([
            [
                name: 'docker_socket', 
                sourcePath:'/var/run/docker.sock', 
                containerPath:'/var/run/docker.sock',
                readOnly: false
            ]
        ])
    }
}
```

