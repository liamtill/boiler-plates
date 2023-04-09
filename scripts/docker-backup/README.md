## docker-backup

Basic script to backup docker container data. Stops containers, backs up data, notifies using Gotify on errors and then starts container back up.

* Add containers you want to backup to `docker_containers`
* Set the required env vars using `.env.example` as a base
* Set up Gotify to get failure notifications - remove from script if not required.
* Set up your backups schedule as a cron job