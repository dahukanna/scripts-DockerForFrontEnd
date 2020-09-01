#!/bin/bash
## ==========================================================================
## Updated on Sunday 22 Aug 2017 16:27:20 GMT+0200 (CST)
## Description: Bash Shell script for config and running application Development Environment Runtimes in Docker containers.
## Package: Bash Shell script for development environment runtimes in Docker Container.
## Version: v0.0.6
## Contributors: Dawn Ahukanna <dawn.n.ahukanna@ibm.com>
## Licence:
##
## Notice:
## ==========================================================================
##
## docs == https://hub.docker.com/_/php/, https://docs.docker.com/engine/reference/commandline/run/


echo "===================="
echo " Check::container development environment variables."
echo "===================="
echo Checking docker container environment variables ...
echo DOCKER_PORT=${DOCKER_PORT}
echo DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}


echo "===================="
echo " Start::local development environment within container."
echo "===================="
echo "Assign PORT and APPLICATION_DIR ..."
PORT=${DOCKER_PORT}
echo PORT=${PORT}
APPLICATION_DIR=${DOCKER_APPLICATION_DIR}
echo APPLICATION_DIR=${APPLICATION_DIR}

echo "Export PORT and APPLICATION_DIR ..."
export PORT
export APPLICATION_DIR

echo "===================="
echo " Start::local development environment within container ..."
echo "===================="
echo Starting application ...
cd ${APPLICATION_DIR}
gem install bundler
bundle install
bundle exec jekyll serve --port ${PORT} --verbose --incremental
# bundle exec jekyll serve --port ${PORT} --verbose

echo "===================="
echo " Exiting::local development environment within container."
echo "===================="
exit
