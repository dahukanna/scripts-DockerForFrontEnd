#!/bin/bash
## trace == bash -x <script name>

docker pull hello-world:latest
docker pull portainer/portainer:latest
docker pull node:latest
docker pull ruby:2.1
docker pull php:7.1-apache

docker system prune