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
echo DOCKER_COMMAND_NPM_RUN=${DOCKER_COMMAND_NPM_RUN}


echo "===================="
echo " Start::local development environment within container."
echo "===================="
echo "Assign PORT and APPLICATION_DIR ..."
PORT=${DOCKER_PORT}
echo PORT=${PORT}
APPLICATION_DIR=${DOCKER_APPLICATION_DIR}
echo APPLICATION_DIR=${APPLICATION_DIR}
APPLICATION_START=${DOCKER_COMMAND_NPM_RUN}
echo APPLICATION_START=${APPLICATION_START}

echo "Install NVM ..."
NVM_NODE_VERSION=$(< ../.nvmrc)
echo NVM_NODE_VERSION=${NVM_NODE_VERSION}

echo "Export PORT and APPLICATION_DIR ..."
export PORT
export APPLICATION_DIR
export NVM_NODE_VERSION

echo "===================="
echo " Configure local development environment within container ..."
echo "===================="
echo Install nvm ...
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

echo Configure nvm ...
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo "Use Node.Js version specified in ../.nvmrc ..."
cd ${APPLICATION_DIR}
echo " nvm install version "${NVM_NODE_VERSION}
nvm install ${NVM_NODE_VERSION}
echo " nvm use"
nvm use

echo "# ===================="
echo "# Start local development environment within container, using npm scripts"
echo "# ===================="
echo Starting ...
cd ${APPLICATION_DIR}

if [ ${PORT} -eq 5000 ]; then
    npm install -g nodemon
    npm install -g babel-cli
fi

if [ ${PORT} -eq 5001 ]; then
    npm install -g babel-cli
        #  Hello there undefined 😛                           │
        #| You tried to install babel-node. This is not babel-node 🚫          │
        #| You should npm install -g babel-cli instead 💁 .               │
        #| I took this module to prevent somebody from pushing malicious code. 🕵    │
        #| Be careful out there, undefined! 👍  
    
    ## for Node prodiction environment
    npm run compile
fi

if [ ${DOCKER_COMMAND_NPM_RUN} -eq "start" ]; then
    npm start
else
    npm run ${DOCKER_COMMAND_NPM_RUN}
fi

echo "# ===================="
echo "# Exiting::local development environment within container"
echo "# ===================="
exit