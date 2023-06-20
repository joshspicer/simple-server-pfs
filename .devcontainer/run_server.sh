#!/bin/bash

ROOT_FOLDER="/workspaces/simple-server-pfs"

# Install Forever silently
npm install --silent forever -g  > '/dev/null' 2>&1

# Start Forever server for index.js in the background
forever start "$ROOT_FOLDER/index.js"

# Check if the server has started
while true; do
  # Check if the server is running
  if forever list | grep -q "index.js"; then
    echo "Server started successfully."
    break
  fi
  sleep 1
done

TOKEN_FILE="$ROOT_FOLDER/token.txt"

touch $TOKEN_FILE

echo $GITHUB_TOKEN >> $TOKEN_FILE