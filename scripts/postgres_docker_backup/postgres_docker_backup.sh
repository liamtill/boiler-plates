#!/bin/bash

source .env

docker exec -t postgres pg_dump -U $PG_USER $PG_DB | gzip > $PG_BACKUP_DIR$BACKUP_FILE

rclone copy $LOCAL_PG_BACKUP_DIR$BACKUP_FILE $BACKUP_DIR
# $(date +"%Y-%m-%d_%H_%M_%S")