#!/bin/bash
## ==========================================================================
## Updated on Sunday 22 Aug 2017 16:27:20 GMT+0200 (CST)
## Description: Bash Shell script for config and creation of Docker containers for Development Environment Runtimes. 
## Package: Bash Shell script for Docker Container development environment runtimes.
## Version: v0.0.5
## Contributors: Dawn Ahukanna <dawn.n.ahukanna@ibm.com>
## Licence: 
##
## Notice:
## ==========================================================================
##
## docs == https://hub.docker.com/_/php/, https://docs.docker.com/engine/reference/commandline/run/

## ====================
## Start Docker container script for various development environments
##  Bash shell scripting details from http://tldp.org/LDP/abs/html/testbranch.html
## ====================

## Declare Functions
    fxnPause ()
    {
        # Shows se
        read -p "Press [Enter] key to continue or CRTL+c to exit ..."

        ## Alternative
        # read -p "$*"
        ## call it outside the function
        # pause 'Press [Enter] key to continue...'
    }

    fxnPrintUsage ()
    {
    # Shows selection of port numbers associated with Docker container development environment runtimes.
        echo "===================="
        echo " Docker instances to start."
        echo "===================="
        echo "Choose one of the following containers by typing the relevant number and press 'Enter' key:" 
        echo
            ## Docker engine web interface. (Docker in Docker - DinD)
            echo "[9000] for Portainer, Docker WebUI."
        echo
            ## Development runtime environments for IoT Workplace Web UI. 
            echo "[5000] for Web App with ReactJS."
            echo "[5001] for Web App  with VueJS."
        echo
            ##  Development runtime environments for personal experiments
            echo "[5200] for NodeJS server playground sandbox."
            echo "[5201] for LAMP server with Grav installed."
        echo
            ##  Development runtime environments for personal curated content
            echo "[5230] for Web App with Jekyll on Ruby."
        echo
    }

    fxnUpdateScriptFiles ()
    {
        ## Copy configured application setup script to the application directory which will be executed within the container.
        echo remove directory ${MOUNT_DIR}/${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}
        rm -Rf ${MOUNT_DIR}/${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}
        echo make directory ${MOUNT_DIR}/${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}
        mkdir ${MOUNT_DIR}/${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}
        echo copy ${DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME} to ${MOUNT_DIR}/${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}/${const_DOCKER_APPLICATION_SETUP_SCRIPT_NAME}
        cp ${DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME} ${MOUNT_DIR}/${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}/${const_DOCKER_APPLICATION_SETUP_SCRIPT_NAME}
        echo change script permissions to executable 
        chmod +x ${MOUNT_DIR}/${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}/${const_DOCKER_APPLICATION_SETUP_SCRIPT_NAME}
    }

## Declare variables that will be used as constants
    const_DOCKER_APPLICATION_SCRIPT_DIR_NAME=@dockerContainerAssets
    const_DOCKER_APPLICATION_SETUP_SCRIPT_NAME=setupDevEnvironment.sh
    const_DOCKER_APPLICATION_SETUP_SCRIPT_NAME_RUBY=setupDevEnvironment-Ruby.sh
    const_DOCKER_APPLICATION_SETUP_SCRIPT_NAME_NODE_NVM=setupDevEnvironment-Node-NVM.sh

## Declare Variables
    VALID_INPUT=1 ## true=1, false=0

## Execute
clear ## Clear the screen.

fxnPrintUsage ## Print usage to screen.

read port ## User enters integer from the choices listed and presses "Enter" key.

echo
echo "You selected ${port}"

echo "===================="
echo " Setup::docker container variables for development runtimes."
echo "===================="
echo Setup selected docker container variables for development runtime ...

case "$port" in
    "9000" )
        #ROOT_DIR=/Users/daphoenix/_home/_run
        #echo ROOT_DIR=${ROOT_DIR}
        PROJECT_DIR=/var/run/docker.sock
        echo PROJECT_DIR=${PROJECT_DIR}
        WORKING_DIR=${PROJECT_DIR}
        #WORKING_DIR=/portainer
        echo WORKING_DIR=${WORKING_DIR}
        MOUNT_DIR=/var/run/docker.sock
        echo MOUNT_DIR=${MOUNT_DIR}

        HOST_PORT=$port
        echo HOST_PORT=${HOST_PORT}
        CONTAINER_PORT=$port
        echo CONTAINER_PORT=${HOST_PORT}

        DOCKER_IMAGE=portainer/portainer
        echo DOCKER_IMAGE=${DOCKER_IMAGE}
        DOCKER_CONTAINER_NAME=dockerweb
        echo DOCKER_CONTAINER_NAME=${DOCKER_CONTAINER_NAME}
        #DOCKER_COMMAND=/bin/bash
        #echo DOCKER_COMMAND=${DOCKER_COMMAND}

    ;;

    "5000" )
        echo "--------------------"
        echo " Declare::development docker container variables for PORT = "$port
        echo "--------------------"
        ROOT_DIR=/Users/daphoenix/home/githubEnterprise
        echo ROOT_DIR=${ROOT_DIR}
        PROJECT_DIR=/react-project
        echo PROJECT_DIR=${PROJECT_DIR}
        WORKING_DIR=/react-project
        echo WORKING_DIR=${WORKING_DIR}
        echo
        DOCKER_IMAGE=node:latest
        echo DOCKER_IMAGE=${DOCKER_IMAGE}
        DOCKER_CONTAINER_NAME=react-project
        echo DOCKER_CONTAINER_NAME=${DOCKER_CONTAINER_NAME}
        DOCKER_COMMAND=/bin/bash
        echo DOCKER_COMMAND=${DOCKER_COMMAND}
        DOCKER_COMMAND_NPM_RUN=startLocalDebug
        echo DOCKER_COMMAND_NPM_RUN=${DOCKER_COMMAND_NPM_RUN}
        DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME=./${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}/${const_DOCKER_APPLICATION_SETUP_SCRIPT_NAME_NODE_NVM}
        echo DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME=${DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME}
        echo
    ;;

    "5001" )
        echo "--------------------"
        echo " Declare::development docker container variables for PORT = "$port
        echo "--------------------"
        ROOT_DIR=/Users/daphoenix/home/githubEnterprise
        echo ROOT_DIR=${ROOT_DIR}
        PROJECT_DIR=/vue-project
        echo PROJECT_DIR=${PROJECT_DIR}
        #WORKING_DIR=${PROJECT_DIR}
        WORKING_DIR=/vue-project
        echo WORKING_DIR=${WORKING_DIR}
        echo
        DOCKER_IMAGE=node:latest
        echo DOCKER_IMAGE=${DOCKER_IMAGE}
        DOCKER_CONTAINER_NAME=vue-project
        echo DOCKER_CONTAINER_NAME=${DOCKER_CONTAINER_NAME}
        DOCKER_COMMAND=/bin/bash
        echo DOCKER_COMMAND=${DOCKER_COMMAND}
        DOCKER_COMMAND_NPM_RUN=startLocalDebug
        echo DOCKER_COMMAND_NPM_RUN=${DOCKER_COMMAND_NPM_RUN}
        DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME=./${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}/${const_DOCKER_APPLICATION_SETUP_SCRIPT_NAME_NODE_NVM}
        echo DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME=${DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME}
        echo
    ;;

    "5200" )
        echo "--------------------"
        echo " Declare::development docker container variables for PORT = "$port
        echo "--------------------"
        ROOT_DIR=/Users/daphoenix/home/githubEnterprise
        echo ROOT_DIR=${ROOT_DIR}
        PROJECT_DIR=/nodeserver_sandbox
        echo PROJECT_DIR=${PROJECT_DIR}
        #WORKING_DIR=${PROJECT_DIR}
        WORKING_DIR=/nodeserver_sandbox
        echo WORKING_DIR=${WORKING_DIR}
        echo
        DOCKER_IMAGE=node:latest
        echo DOCKER_IMAGE=${DOCKER_IMAGE}
        DOCKER_CONTAINER_NAME=nodeserver-sandbox
        echo DOCKER_CONTAINER_NAME=${DOCKER_CONTAINER_NAME}
        DOCKER_COMMAND=/bin/bash
        echo DOCKER_COMMAND=${DOCKER_COMMAND}
        DOCKER_COMMAND_NPM_RUN=none
        echo DOCKER_COMMAND_NPM_RUN=${DOCKER_COMMAND_NPM_RUN}
        DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME=./${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}/${const_DOCKER_APPLICATION_SETUP_SCRIPT_NAME_NODE_NVM}
        echo DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME=${DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME}
        echo
        echo "--------------------"
        echo " Derive::development docker container variables for PORT = "$port
        echo "--------------------"        
        MOUNT_DIR=${ROOT_DIR}${PROJECT_DIR}
        echo MOUNT_DIR=${MOUNT_DIR}
        echo
        HOST_PORT=$port
        echo HOST_PORT=${HOST_PORT}
        CONTAINER_PORT=$port
        echo CONTAINER_PORT=${HOST_PORT}
        echo
        DOCKER_APPLICATION_DIR=${WORKING_DIR}
        echo DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}
        DOCKER_APPLICATION_SCRIPT_DIR=${DOCKER_APPLICATION_DIR}/${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}
        echo DOCKER_APPLICATION_SCRIPT_DIR=${DOCKER_APPLICATION_SCRIPT_DIR}
        DOCKER_APPLICATION_SETUP_SCRIPT_PATH=${DOCKER_APPLICATION_SCRIPT_DIR}/${const_DOCKER_APPLICATION_SETUP_SCRIPT_NAME}
        echo DOCKER_APPLICATION_SETUP_SCRIPT_PATH=${DOCKER_APPLICATION_SETUP_SCRIPT_PATH}
        echo
    ;;

    "5201" )
        echo "--------------------"
        echo " Declare::development docker container variables for PORT = "$port
        echo "--------------------"
        ROOT_DIR=/Users/daphoenix/home/githubEnterprise
        echo ROOT_DIR=${ROOT_DIR}
        PROJECT_DIR=/LAMP
        echo PROJECT_DIR=${PROJECT_DIR}
        #WORKING_DIR=${PROJECT_DIR}
        WORKING_DIR=/var/www/html
        echo WORKING_DIR=${WORKING_DIR}
        echo
        DOCKER_IMAGE=php:7.1-apache
        echo DOCKER_IMAGE=${DOCKER_IMAGE}
        DOCKER_CONTAINER_NAME=php-apache
        echo DOCKER_CONTAINER_NAME=${DOCKER_CONTAINER_NAME}
        DOCKER_COMMAND=/bin/bash
        echo DOCKER_COMMAND=${DOCKER_COMMAND}
        echo
        echo "--------------------"
        echo " Derive::development docker container variables for PORT = "$port
        echo "--------------------"        
        MOUNT_DIR=${ROOT_DIR}${PROJECT_DIR}
        echo MOUNT_DIR=${MOUNT_DIR}
        echo
        HOST_PORT=$port
        echo HOST_PORT=${HOST_PORT}
        CONTAINER_PORT=80
        echo CONTAINER_PORT=${HOST_PORT}
        echo
        DOCKER_APPLICATION_DIR=${WORKING_DIR}
        echo DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}
        echo
    ;;

    "5230" )
        echo "--------------------"
        echo " Declare::development docker container variables for PORT = "$port
        echo "--------------------"
        ROOT_DIR=/Users/daphoenix/home/githubEnterprise
        echo ROOT_DIR=${ROOT_DIR}
        PROJECT_DIR=/jekyll-project
        echo PROJECT_DIR=${PROJECT_DIR}
        #WORKING_DIR=${PROJECT_DIR}
        WORKING_DIR=/jekyll-project
        echo WORKING_DIR=${WORKING_DIR}
        echo
        DOCKER_IMAGE=ruby:2.1
        echo DOCKER_IMAGE=${DOCKER_IMAGE}
        DOCKER_CONTAINER_NAME=jekyll-project
        echo DOCKER_CONTAINER_NAME=${DOCKER_CONTAINER_NAME}
        DOCKER_COMMAND=/bin/bash
        echo DOCKER_COMMAND=${DOCKER_COMMAND}
        echo
    ;;

    * )
        # Default or everything else option.	  
        # Empty input (hitting RETURN) fits here, too.
        VALID_INPUT=0
  ;;

esac

if [ ${VALID_INPUT} -eq 1 ]; then
    echo "# ===================="
    echo "# Start::local development container."
    echo "# ===================="

    if [ ${port} -eq 9000 ]; then
        ## Use this for normal operation as Portainer is running as a single process daemon.
        docker run --name ${DOCKER_CONTAINER_NAME} -d -p ${HOST_PORT}:${CONTAINER_PORT} --rm  -v ${MOUNT_DIR}:${MOUNT_DIR} ${DOCKER_IMAGE}

    else

        ## Use this for starting a Docker container. If configured, it may also execute the application setup script within the Docker container runtime.

        if [[ ${port} -eq 5000 || ${port} -eq 5001 ]]; then
            echo "--------------------"
            echo " Derive::development docker container variables for PORT = "$port
            echo "--------------------"        
            MOUNT_DIR=${ROOT_DIR}${PROJECT_DIR}
            echo MOUNT_DIR=${MOUNT_DIR}
            echo
            HOST_PORT=$port
            echo HOST_PORT=${HOST_PORT}
            CONTAINER_PORT=$port
            echo CONTAINER_PORT=${HOST_PORT}
            echo
            DOCKER_APPLICATION_DIR=${WORKING_DIR}
            echo DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}
            DOCKER_APPLICATION_SCRIPT_DIR=${DOCKER_APPLICATION_DIR}/${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}
            echo DOCKER_APPLICATION_SCRIPT_DIR=${DOCKER_APPLICATION_SCRIPT_DIR}
            DOCKER_APPLICATION_SETUP_SCRIPT_PATH=${DOCKER_APPLICATION_SCRIPT_DIR}/${const_DOCKER_APPLICATION_SETUP_SCRIPT_NAME}
            echo DOCKER_APPLICATION_SETUP_SCRIPT_PATH=${DOCKER_APPLICATION_SETUP_SCRIPT_PATH}
            echo

            fxnUpdateScriptFiles

            fxnPause

            ## Docker container in detached mode, without a terminal for ad-hoc attachment of a terminal. It executes the application setup script within the container runtime.
            #echo docker run -dit -e "DOCKER_PORT=${CONTAINER_PORT}" -e "DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}" -e "DOCKER_COMMAND_NPM_RUN=${DOCKER_COMMAND_NPM_RUN}" --name ${DOCKER_CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -w ${WORKING_DIR} -v ${MOUNT_DIR}:${WORKING_DIR} --entrypoint ${DOCKER_APPLICATION_SETUP_SCRIPT_PATH} ${DOCKER_IMAGE} ${DOCKER_COMMAND}
            #docker run -dit -e "DOCKER_PORT=${CONTAINER_PORT}" -e "DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}" -e "DOCKER_COMMAND_NPM_RUN=${DOCKER_COMMAND_NPM_RUN}" --name ${DOCKER_CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -w ${WORKING_DIR} -v ${MOUNT_DIR}:${WORKING_DIR} --entrypoint ${DOCKER_APPLICATION_SETUP_SCRIPT_PATH} ${DOCKER_IMAGE} ${DOCKER_COMMAND}

            ## Start Docker container in interactive terminal mode. Use this for monitoring, debugging or troubleshooting runtime.
            #echo docker run -it -e "DOCKER_PORT=${CONTAINER_PORT}" -e "DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}" -e "DOCKER_COMMAND_NPM_RUN=${DOCKER_COMMAND_NPM_RUN}" --name ${DOCKER_CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -w ${WORKING_DIR} -v ${MOUNT_DIR}:${WORKING_DIR} ${DOCKER_IMAGE} ${DOCKER_COMMAND}
            #docker run -it -e "DOCKER_PORT=${CONTAINER_PORT}" -e "DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}" -e "DOCKER_COMMAND_NPM_RUN=${DOCKER_COMMAND_NPM_RUN}" --name ${DOCKER_CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -w ${WORKING_DIR} -v ${MOUNT_DIR}:${WORKING_DIR} ${DOCKER_IMAGE} ${DOCKER_COMMAND}

            echo docker run -it -e "DOCKER_PORT=${CONTAINER_PORT}" -e "DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}" -e "DOCKER_COMMAND_NPM_RUN=${DOCKER_COMMAND_NPM_RUN}" --name ${DOCKER_CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -w ${WORKING_DIR} -v ${MOUNT_DIR}:${WORKING_DIR} --entrypoint ${DOCKER_APPLICATION_SETUP_SCRIPT_PATH} ${DOCKER_IMAGE} ${DOCKER_COMMAND}
            docker run -it -e "DOCKER_PORT=${CONTAINER_PORT}" -e "DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}" -e "DOCKER_COMMAND_NPM_RUN=${DOCKER_COMMAND_NPM_RUN}" --name ${DOCKER_CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -w ${WORKING_DIR} -v ${MOUNT_DIR}:${WORKING_DIR} --entrypoint ${DOCKER_APPLICATION_SETUP_SCRIPT_PATH} ${DOCKER_IMAGE} ${DOCKER_COMMAND}

        fi 

       
        if [[ ${port} -eq 5200 || ${port} -eq 5201 ]]; then
            fxnUpdateScriptFiles

            fxnPause

            # Start Docker Container as an Interactive bash shell.
            echo docker run -it -e "DOCKER_PORT=${CONTAINER_PORT}" -e "DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}" --name ${DOCKER_CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -w ${WORKING_DIR} -v ${MOUNT_DIR}:${WORKING_DIR} ${DOCKER_IMAGE} ${DOCKER_COMMAND}
            docker run -it -e "DOCKER_PORT=${CONTAINER_PORT}" -e "DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}" --name ${DOCKER_CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -w ${WORKING_DIR} -v ${MOUNT_DIR}:${WORKING_DIR} ${DOCKER_IMAGE} ${DOCKER_COMMAND}
        fi 

        if [ ${port} -eq 5230 ]; then
            echo "--------------------"
            echo " Derive::development docker container variables for PORT = "$port
            echo "--------------------"        
            MOUNT_DIR=${ROOT_DIR}${PROJECT_DIR}
            echo MOUNT_DIR=${MOUNT_DIR}
            echo
            HOST_PORT=$port
            echo HOST_PORT=${HOST_PORT}
            CONTAINER_PORT=$port
            echo CONTAINER_PORT=${HOST_PORT}
            echo
            DOCKER_APPLICATION_DIR=${WORKING_DIR}
            echo DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}
            DOCKER_APPLICATION_SCRIPT_DIR=${DOCKER_APPLICATION_DIR}/${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}
            echo DOCKER_APPLICATION_SCRIPT_DIR=${DOCKER_APPLICATION_SCRIPT_DIR}
            DOCKER_APPLICATION_SETUP_SCRIPT_PATH=${DOCKER_APPLICATION_SCRIPT_DIR}/${const_DOCKER_APPLICATION_SETUP_SCRIPT_NAME}
            echo DOCKER_APPLICATION_SETUP_SCRIPT_PATH=${DOCKER_APPLICATION_SETUP_SCRIPT_PATH}
            DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME=./${const_DOCKER_APPLICATION_SCRIPT_DIR_NAME}/${const_DOCKER_APPLICATION_SETUP_SCRIPT_NAME_RUBY}
            echo DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME=${DOCKER_APPLICATION_SETUP_SCRIPT_SOURCE_NAME}
            echo

            fxnUpdateScriptFiles

            fxnPause

            # Start Docker Container in "detached" mode, without an interactive bash shell.
            echo docker run -dit -e "DOCKER_PORT=${CONTAINER_PORT}" -e "DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}" --name ${DOCKER_CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -w ${WORKING_DIR} -v ${MOUNT_DIR}:${WORKING_DIR} --entrypoint ${DOCKER_APPLICATION_SETUP_SCRIPT_PATH} ${DOCKER_IMAGE} ${DOCKER_COMMAND}
            docker run -dit -e "DOCKER_PORT=${CONTAINER_PORT}" -e "DOCKER_APPLICATION_DIR=${DOCKER_APPLICATION_DIR}" --name ${DOCKER_CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -w ${WORKING_DIR} -v ${MOUNT_DIR}:${WORKING_DIR} ${DOCKER_IMAGE} ${DOCKER_COMMAND}
        fi
    fi

    echo "# ===================="
    echo "# Exiting::local development container."
    echo "# ===================="

    exit 0
else    
    fxnPrintUsage
    exit 1
fi