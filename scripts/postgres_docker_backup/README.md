## postgres_docker_backup

Basic script to backup postgres database data from docker container. Runs a pg_dump and gzip to a defined destination.

* Set required environment variables using `.env.example` as a template. 
* Set up backup job using cron job