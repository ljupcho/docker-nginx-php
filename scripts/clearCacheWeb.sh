#!/bin/bash

# clear the cache after .env change
docker-compose exec web php artisan config:cache 
docker-compose exec web php artisan cache:clear