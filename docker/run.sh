#!/bin/bash

# change it up to what you need
SHARED_DIR=`pwd`

# name of image
IMAGE_NAME="buildroot:latest"

# map shared folder to container
VOLUME_OPT="-v /${SHARED_DIR}:/home/user"

# set container name hence we can stop via its name instead of auto-gen magic id
CONTAINER_NAME="yocto-env"

# if existed, kill, warning message may print if container had not yet start,
# just ignore it
echo "try to stop container if it is running"
docker stop ${CONTAINER_NAME} > /dev/null

# now we can start
# there is an option where we want to test container, by input '/bin/bash' letting
# us to access to container shell (instead of start cloud9 starting script)
if [ -z "$1" ]; then
	docker run --rm -d ${VOLUME_OPT} ${PORT_OPT} --name ${CONTAINER_NAME} ${IMAGE_NAME}
else
	docker run --rm -it ${VOLUME_OPT} ${PORT_OPT} --name ${CONTAINER_NAME} ${IMAGE_NAME} $*
fi



