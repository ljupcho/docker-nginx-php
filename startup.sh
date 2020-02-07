#!/bin/bash

# Build docker image
#docker-compose up -d --build
# Run all the services except the consumers, which will be run after all the apps are prepaired
docker-compose up -d --scale consumers=0

# note: don't run composer and npm commands on local apps might be a problem on different host OS

######################################################################################
# Prepare WEB container
######################################################################################
# docker-compose exec web git checkout master
docker-compose exec web cp .env.example .env
# Update WEB env variables
docker-compose exec web sed -i 's/APP_DEBUG=.*/APP_DEBUG=false/' .env
docker-compose exec web sed -i 's/APP_URL=.*/APP_URL=http:\/\/localhost:8081\//' .env
docker-compose exec web sed -i 's/DB_DATABASE=.*/DB_DATABASE=web/' .env
docker-compose exec web sed -i 's/DB_HOST=.*/DB_HOST=db/' .env
docker-compose exec web sed -i 's/DB_USERNAME=.*/DB_USERNAME=root/' .env
docker-compose exec web sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=root/' .env
docker-compose exec web sed -i 's/REDIS_HOST=.*/REDIS_HOST=redis/' .env
# Installing the WEB code
docker-compose exec web composer update --no-interaction
"scripts/clearCacheWeb.sh"
docker-compose exec web php artisan key:generate
docker-compose exec web php artisan storage:link
"scripts/clearCacheWeb.sh"
"scripts/migrateWeb.sh"
"scripts/seedWeb.sh"
"scripts/clearCacheWeb.sh"
docker-compose exec web chmod -R 777 storage
# Installing the WEB FE code
docker-compose exec web npm install
"scripts/updateNpmDevWeb.sh"

# after all set and done run the consumers
docker-compose up -d consumers
# start the cron jobs and set the commands under web
docker-compose exec web service cron start
docker-compose exec web crontab ../../../etc/crontab

