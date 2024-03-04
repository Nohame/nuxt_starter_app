#!/bin/sh

# Load specific env file
if [ -e .env ]; then
    source ".env"
else
    echo "Please set up your .env file before starting your environment."
    exit 1
fi

echo "La valeur de APP_NAME est : $APP_NAME"

if [ ! -d "$APP_NAME" ]; then
  echo "Initializing the Nuxt.js project in the folder $APP_NAME..."
  npx nuxi@latest init $APP_NAME
  cd ${APP_NAME}

  echo "Installing dependencies..."
  npm install
else
  echo "The $APP_NAME project is already initialized."
fi

exec "$@"