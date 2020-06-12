#!/bin/bash

# clear the cache after .env change
docker-compose exec web php artisan config:cache --env=testing
docker-compose exec web php artisan cache:clear --env=testing
docker-compose exec web php artisan route:cache --env=testing
