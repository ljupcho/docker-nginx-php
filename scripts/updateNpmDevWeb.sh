#!/bin/bash

docker-compose exec web composer update --no-interaction

"scripts/migrateWeb.sh"
"scripts/seedWeb.sh"

"scripts/clearCacheWeb.sh"

echo "Web updated: composer, migrate, db:seed and cache cleared";