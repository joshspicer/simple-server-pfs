#!/bin/bash

# Install dependencies
npm install

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

ROOT_FOLDER="/workspaces/simple-server-pfs"
TOKEN_FILE="$ROOT_FOLDER/token.txt"

# Delete the token_file if it exists
if [ -f "$TOKEN_FILE" ]; then
  rm "$TOKEN_FILE"
fi

# Create a new token_file and write the GITHUB_TOKEN to it
touch "$TOKEN_FILE"
echo "$GITHUB_TOKEN" >> "$TOKEN_FILE"

# Exit the script
exit 0
