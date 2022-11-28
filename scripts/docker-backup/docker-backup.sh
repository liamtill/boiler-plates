#!/bin/bash

source .env

fail=1

function success {
    RESULT=$?
    if [ $RESULT -eq 0 ]; then
        echo "$1: success"
        success=0
    else
        echo "$1: failed"
        success=1
    fi
    return $success
}

echo "DOCKER BACKUP" $(date)

while read -r ct; do
    echo "Backing up" $ct
    # cd to dir with compose in
    cd $DOCKER_ROOT$ct
    echo "Stopping container" $ct
    # stop service
    success $(docker-compose stop)
    if [ $success -eq 0 ]; then
        echo "Backing up" $ct
        # use rclone to backup service
        #success $(rclone sync $DOCKER_ROOT$ct $BACKUP_ROOT$ct)
        success $(rclone sync --include ".*" $DOCKER_ROOT$ct $BACKUP_ROOT$ct)
        if [ $success -eq 0 ]; then
            echo "Backed up" $ct
            fail=0
        else
            curl "$GOTIFY_URL/message?token=$GOTIFY_TOKEN" -F "title=$ct backup failed" -F "message=Docker backup of $ct has failed" -F "priority=1"
            fail=1
        fi
        # start service
        echo "Starting service"
        success $(docker-compose start)
        fail=0
    else
        curl "$GOTIFY_URL/message?token=$GOTIFY_TOKEN" -F "title=$ct backup failed" -F "message=Docker backup of $ct has failed" -F "priority=1"
        fail=1
    fi
    # restart container if any fails
    if [ $fail -eq 1 ]; then
        docker-compose start
    fi
    sleep 5
done <$CONTAINERS

echo "DOCKER BACKUP COMPLETE" $(date)
