#!/bin/bash -x

if [ "$BUILD_ARGUMENT_ENV" = "dev" ] || [ "$BUILD_ARGUMENT_ENV" = "test" ]; then
    composer install --optimize-autoloader --no-interaction --no-progress
    yarn install && yarn encore dev
else
  export APP_ENV=$BUILD_ARGUMENT_ENV
  composer install --optimize-autoloader --no-interaction --no-progress --no-dev
  yarn install && yarn encore production
fi

if [ "$BUILD_ARGUMENT_ENV" = "prod" ]; then
  composer dump-env $BUILD_ARGUMENT_ENV
fi
