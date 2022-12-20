# Homelab Boiler Plates

This repo contains boiler plate docker compose files and scripts as templates used for my homelab. These will be added to/modified over time as I add new services or modify existing ones. 

## `docker-compose/`

Current listing of compose files:

* BookStack
* Dash.
* Filebrowser
* Gotify
* Homarr
* Jellyfin (Initially created outside media stack)
* Media Stack
    * Bazarr
    * Jellyseer
    * Nzbget
    * Nzbhydra
    * Prowlarr
    * Radarr
    * Sonarr
* Monitoring
    * Telegraf
    * InfluxDB
    * Grafana
* MySQL
* Nginx Proxy Manager
* Paperless-ng
* Portainer
* Postgres
* Synthing
* Telegraf
    * For deploying to other servers
* Uptime Kuma
* Watchtower
* PiHole

## `scripts/`

Contains various custom sccripts used for monitoring, backups etc. Will be added to over time.

* net_check.sh - Basic network ping check to restart interface if network down on device

## Usage

* Clone the repository.
* Copy the `.env.example` to `.env` and modify the environment variables as required for your user/groups IDs, paths and any other relevant environment variables.
* Create required data/config directories for the container. These will be defined in the `.env` file.
* Spin up container(s): `docker-compose up -d`
* Go to `HOST:PORT` of container

## Useful `.gitignore `templates

[Here is a repo of useful `.gitignore` templates](https://github.com/github/gitignore)