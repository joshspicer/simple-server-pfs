#!/bin/bash

# Install Forever silently
npm install --silent forever -g  > '/dev/null' 2>&1

# Start Forever server for index.js in the background
forever start index.js

# Check if the server has started
while true; do
  # Check if the server is running
  if forever list | grep -q "index.js"; then
    echo "Server started successfully."
    break
  fi
  sleep 1
done