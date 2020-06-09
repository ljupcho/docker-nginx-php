#!/bin/bash

docker-compose exec web php -d memory_limit=-1 /usr/local/bin/composer update
