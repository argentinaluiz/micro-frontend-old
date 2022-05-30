#!/bin/bash

if [ ! -f ".env" ]; then
  cp .env.example .env
fi
if [ ! -f ".env.testing" ]; then
  cp .env.testing.example .env.testing
fi

touch database/database.sqlite

composer install
php artisan key:generate
php artisan migrate:refresh --seed

php artisan serve --host=0.0.0.0
