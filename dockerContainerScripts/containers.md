# Protocols and Ports used for docker containers
Using the following `docker run` options -
* `docker`
    * `run`
        * `-e ` - Set environment variables.
        * `-it` - Keep STDIN open even if not attached and Allocate a pseudo-TTY.
        * `-p ${HOST_PORT}:${CONTAINER_PORT}` - Publish a container's port(s) to the host.
        * `--rm` - Automatically remove the container when it exits
        * `-w ${WORKING_DIR}` -  Working directory inside the container
        * `-v ${MOUNT_DIR}:${WORKING_DIR}` - Bind mount a volume
        * `${DOCKER_IMAGE}` - docker image to use.
        * `${DOCKER_COMMAND}` - ??? command-line to run

# Docs
* https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-socket-option

# UI
* Portainer - https://portainer.io/docker.html
